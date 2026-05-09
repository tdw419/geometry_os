; DESCRIPTION: Composite: Renders a blue disk with center (415, 206) and radius 13 then Renders a black line between points (432, 146) and (272, 202).
; PLAN: r0=415(x), r1=206(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x1), r6=146(y1), r7=272(x2), r8=202(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 206
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 146
LDI r7, 272
LDI r8, 202
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
