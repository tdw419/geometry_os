; DESCRIPTION: Composite: Places a magenta dot at position (247, 19) then Draws a green line from (367, 249) to (471, 150) then Places a yellow 45x105 rectangle at position (391, 142).
; PLAN: r0=247(x), r1=19(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=367(x1), r6=249(y1), r7=471(x2), r8=150(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=142(y), r12=45(width), r13=105(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 19
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 249
LDI r7, 471
LDI r8, 150
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 142
LDI r12, 45
LDI r13, 105
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
