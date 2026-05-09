; DESCRIPTION: Composite: Renders a purple disk with center (340, 54) and radius 18 then Places a green line segment connecting (218, 222) to (160, 46).
; PLAN: r0=340(x), r1=54(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x1), r6=222(y1), r7=160(x2), r8=46(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 54
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 222
LDI r7, 160
LDI r8, 46
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
