; DESCRIPTION: Composite: Draws a cyan line from (269, 194) to (378, 202) then Renders a magenta box of size 21x102 starting at (94, 154) then Renders a yellow disk with center (371, 209) and radius 15.
; PLAN: r0=269(x1), r1=194(y1), r2=378(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=154(y), r7=21(width), r8=102(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=209(y), r12=15(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 269
LDI r1, 194
LDI r2, 378
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 154
LDI r7, 21
LDI r8, 102
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 209
LDI r12, 15
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
