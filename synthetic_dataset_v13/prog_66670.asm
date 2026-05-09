; DESCRIPTION: Places a orange 119x49 rectangle at position (54, 190).
; PLAN: r0=54(x), r1=190(y), r2=119(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 190
LDI r2, 119
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
