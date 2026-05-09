; DESCRIPTION: Composite: Draws a cyan circle centered at (470, 224) with radius 14 then Renders a white line between points (441, 88) and (146, 12).
; PLAN: r0=470(x), r1=224(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x1), r6=88(y1), r7=146(x2), r8=12(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 470
LDI r1, 224
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 88
LDI r7, 146
LDI r8, 12
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
