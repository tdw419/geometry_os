; DESCRIPTION: Composite: Renders a purple disk with center (403, 96) and radius 68 then Places a blue line segment connecting (277, 120) to (148, 77).
; PLAN: r0=403(x), r1=96(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=277(x1), r6=120(y1), r7=148(x2), r8=77(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 403
LDI r1, 96
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 277
LDI r6, 120
LDI r7, 148
LDI r8, 77
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
