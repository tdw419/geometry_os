; DESCRIPTION: Composite: Draws a cyan circle centered at (405, 91) with radius 56 then Renders a blue box of size 97x95 starting at (227, 89) then Places a green dot at position (289, 244).
; PLAN: r0=405(x), r1=91(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x), r6=89(y), r7=97(width), r8=95(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=289(x), r11=244(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 91
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 89
LDI r7, 97
LDI r8, 95
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 244
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
