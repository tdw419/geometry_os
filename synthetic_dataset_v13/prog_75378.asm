; DESCRIPTION: Composite: Places a yellow line segment connecting (473, 91) to (247, 66) then Renders a cyan disk with center (173, 124) and radius 17.
; PLAN: r0=473(x1), r1=91(y1), r2=247(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=124(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 473
LDI r1, 91
LDI r2, 247
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 124
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
