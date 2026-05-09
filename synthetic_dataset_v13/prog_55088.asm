; DESCRIPTION: Composite: Places a red dot at position (229, 206) then Renders a green box of size 46x90 starting at (451, 106) then Renders a magenta line between points (28, 155) and (44, 111).
; PLAN: r0=229(x), r1=206(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=451(x), r6=106(y), r7=46(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=28(x1), r11=155(y1), r12=44(x2), r13=111(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 206
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 451
LDI r6, 106
LDI r7, 46
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 155
LDI r12, 44
LDI r13, 111
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
