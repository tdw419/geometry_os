; DESCRIPTION: Composite: Places a black line segment connecting (370, 140) to (322, 204) then Renders a green box of size 13x115 starting at (402, 13).
; PLAN: r0=370(x1), r1=140(y1), r2=322(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=13(y), r7=13(width), r8=115(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 140
LDI r2, 322
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 13
LDI r7, 13
LDI r8, 115
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
