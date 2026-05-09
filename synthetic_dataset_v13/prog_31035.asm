; DESCRIPTION: Composite: Places a black 107x94 rectangle at position (154, 48) then Draws a red line from (112, 33) to (322, 23) then Places a magenta circle of radius 27 at center (281, 109).
; PLAN: r0=154(x), r1=48(y), r2=107(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x1), r6=33(y1), r7=322(x2), r8=23(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=281(x), r11=109(y), r12=27(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 154
LDI r1, 48
LDI r2, 107
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 33
LDI r7, 322
LDI r8, 23
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 109
LDI r12, 27
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
