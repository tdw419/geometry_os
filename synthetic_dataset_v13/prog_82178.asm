; DESCRIPTION: Composite: Renders a orange disk with center (340, 101) and radius 60 then Renders a blue line between points (392, 157) and (406, 192).
; PLAN: r0=340(x), r1=101(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x1), r6=157(y1), r7=406(x2), r8=192(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 101
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 157
LDI r7, 406
LDI r8, 192
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
