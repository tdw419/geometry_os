; DESCRIPTION: Places a orange 105x25 rectangle at position (249, 190).
; PLAN: r0=249(x), r1=190(y), r2=105(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 190
LDI r2, 105
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
