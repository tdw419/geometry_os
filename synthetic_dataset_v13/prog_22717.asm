; DESCRIPTION: Composite: Creates a green circular shape at (336, 91) with radius 25 then Places a green dot at position (493, 88) then Renders a white line between points (380, 189) and (49, 231).
; PLAN: r0=336(x), r1=91(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=493(x), r6=88(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=380(x1), r11=189(y1), r12=49(x2), r13=231(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 91
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 493
LDI r6, 88
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 380
LDI r11, 189
LDI r12, 49
LDI r13, 231
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
