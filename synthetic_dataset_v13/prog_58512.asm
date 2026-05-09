; DESCRIPTION: Composite: Places a green circle of radius 70 at center (366, 176) then Renders a green box of size 23x37 starting at (241, 147) then Places a green dot at position (392, 207).
; PLAN: r0=366(x), r1=176(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=147(y), r7=23(width), r8=37(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=392(x), r11=207(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 366
LDI r1, 176
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 147
LDI r7, 23
LDI r8, 37
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 207
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
