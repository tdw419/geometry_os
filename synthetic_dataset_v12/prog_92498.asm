; DESCRIPTION: Composite: Renders a blue box of size 106x95 starting at (369, 22) then Sets a single white pixel at (3, 163).
; PLAN: r0=369(x), r1=22(y), r2=106(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x), r6=163(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 369
LDI r1, 22
LDI r2, 106
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 163
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
