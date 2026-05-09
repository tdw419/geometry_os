; DESCRIPTION: Renders a red box of size 112x79 starting at (311, 175).
; PLAN: r0=311(x), r1=175(y), r2=112(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 175
LDI r2, 112
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
