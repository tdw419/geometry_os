; DESCRIPTION: Composite: Renders a blue disk with center (172, 176) and radius 78 then Draws a black line from (336, 164) to (330, 231).
; PLAN: r0=172(x), r1=176(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x1), r6=164(y1), r7=330(x2), r8=231(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 176
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 164
LDI r7, 330
LDI r8, 231
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
