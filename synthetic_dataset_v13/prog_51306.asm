; DESCRIPTION: Composite: Draws a purple line from (360, 79) to (12, 63) then Places a red circle of radius 20 at center (130, 92).
; PLAN: r0=360(x1), r1=79(y1), r2=12(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=92(y), r7=20(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 79
LDI r2, 12
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 92
LDI r7, 20
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
