; DESCRIPTION: Composite: Renders a blue disk with center (281, 196) and radius 60 then Places a green line segment connecting (453, 210) to (217, 211) then Sets a single white pixel at (99, 4).
; PLAN: r0=281(x), r1=196(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x1), r6=210(y1), r7=217(x2), r8=211(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=4(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 281
LDI r1, 196
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 210
LDI r7, 217
LDI r8, 211
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 4
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
