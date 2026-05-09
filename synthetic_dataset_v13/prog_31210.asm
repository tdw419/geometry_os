; DESCRIPTION: Renders a yellow box of size 110x31 starting at (35, 190).
; PLAN: r0=35(x), r1=190(y), r2=110(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 190
LDI r2, 110
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
