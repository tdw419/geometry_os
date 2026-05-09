; DESCRIPTION: Composite: Places a green dot at position (109, 211) then Places a magenta 12x26 rectangle at position (305, 193) then Draws a black line from (414, 108) to (343, 238).
; PLAN: r0=109(x), r1=211(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=193(y), r7=12(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x1), r11=108(y1), r12=343(x2), r13=238(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 211
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 305
LDI r6, 193
LDI r7, 12
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 108
LDI r12, 343
LDI r13, 238
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
