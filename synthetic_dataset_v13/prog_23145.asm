; DESCRIPTION: Composite: Places a purple dot at position (420, 144) then Draws a yellow line from (139, 17) to (219, 23) then Renders a magenta box of size 111x63 starting at (123, 168).
; PLAN: r0=420(x), r1=144(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=139(x1), r6=17(y1), r7=219(x2), r8=23(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=123(x), r11=168(y), r12=111(width), r13=63(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 420
LDI r1, 144
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 17
LDI r7, 219
LDI r8, 23
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 168
LDI r12, 111
LDI r13, 63
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
