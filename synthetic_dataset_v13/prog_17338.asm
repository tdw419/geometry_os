; DESCRIPTION: Composite: Draws a white line from (111, 237) to (410, 95) then Renders a magenta disk with center (22, 150) and radius 15.
; PLAN: r0=111(x1), r1=237(y1), r2=410(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=150(y), r7=15(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 111
LDI r1, 237
LDI r2, 410
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 150
LDI r7, 15
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
