; DESCRIPTION: Renders a yellow box of size 75x99 starting at (311, 96).
; PLAN: r0=311(x), r1=96(y), r2=75(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 96
LDI r2, 75
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
