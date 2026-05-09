; DESCRIPTION: Composite: Places a cyan 24x29 rectangle at position (60, 188) then Draws a magenta line from (56, 206) to (405, 227) then Renders a black disk with center (440, 48) and radius 36.
; PLAN: r0=60(x), r1=188(y), r2=24(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x1), r6=206(y1), r7=405(x2), r8=227(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=440(x), r11=48(y), r12=36(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 60
LDI r1, 188
LDI r2, 24
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 206
LDI r7, 405
LDI r8, 227
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 48
LDI r12, 36
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
