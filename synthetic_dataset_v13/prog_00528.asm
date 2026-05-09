; DESCRIPTION: Composite: Renders a purple line between points (305, 224) and (244, 171) then Places a white circle of radius 39 at center (370, 130).
; PLAN: r0=305(x1), r1=224(y1), r2=244(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=130(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 224
LDI r2, 244
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 130
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
