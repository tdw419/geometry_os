; DESCRIPTION: Composite: Draws a magenta line from (302, 236) to (146, 5) then Places a black dot at position (223, 147) then Renders a black box of size 103x39 starting at (48, 97).
; PLAN: r0=302(x1), r1=236(y1), r2=146(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=147(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=48(x), r11=97(y), r12=103(width), r13=39(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 236
LDI r2, 146
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 147
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 48
LDI r11, 97
LDI r12, 103
LDI r13, 39
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
