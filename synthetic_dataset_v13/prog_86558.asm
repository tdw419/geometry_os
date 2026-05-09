; DESCRIPTION: Composite: Renders a magenta disk with center (281, 72) and radius 66 then Sets a single black pixel at (352, 159) then Draws a orange line from (191, 243) to (198, 30).
; PLAN: r0=281(x), r1=72(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=159(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=191(x1), r11=243(y1), r12=198(x2), r13=30(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 72
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 159
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 191
LDI r11, 243
LDI r12, 198
LDI r13, 30
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
