; DESCRIPTION: Composite: Creates a green circular shape at (281, 122) with radius 27 then Places a black dot at position (91, 204) then Draws a black line from (96, 155) to (392, 176).
; PLAN: r0=281(x), r1=122(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x), r6=204(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=96(x1), r11=155(y1), r12=392(x2), r13=176(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 122
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 204
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 96
LDI r11, 155
LDI r12, 392
LDI r13, 176
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
