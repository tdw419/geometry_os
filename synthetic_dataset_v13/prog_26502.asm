; DESCRIPTION: Composite: Renders a magenta disk with center (444, 50) and radius 30 then Places a blue line segment connecting (502, 0) to (316, 220).
; PLAN: r0=444(x), r1=50(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=502(x1), r6=0(y1), r7=316(x2), r8=220(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 50
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 502
LDI r6, 0
LDI r7, 316
LDI r8, 220
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
