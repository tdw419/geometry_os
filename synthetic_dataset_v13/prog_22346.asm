; DESCRIPTION: Places a orange 38x29 rectangle at position (118, 190).
; PLAN: r0=118(x), r1=190(y), r2=38(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 190
LDI r2, 38
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
