; DESCRIPTION: Composite: Renders a purple disk with center (275, 227) and radius 27 then Places a black line segment connecting (346, 205) to (333, 191).
; PLAN: r0=275(x), r1=227(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x1), r6=205(y1), r7=333(x2), r8=191(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 227
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 205
LDI r7, 333
LDI r8, 191
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
