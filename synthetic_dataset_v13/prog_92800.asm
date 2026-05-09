; DESCRIPTION: Composite: Renders a white line between points (94, 195) and (340, 248) then Creates a black rectangular region at (143, 211) spanning 62 by 43 pixels.
; PLAN: r0=94(x1), r1=195(y1), r2=340(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=211(y), r7=62(width), r8=43(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 195
LDI r2, 340
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 211
LDI r7, 62
LDI r8, 43
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
