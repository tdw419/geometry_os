; DESCRIPTION: Composite: Renders a green line between points (305, 253) and (84, 111) then Renders a green box of size 48x32 starting at (433, 60) then Creates a magenta circular shape at (155, 144) with radius 60.
; PLAN: r0=305(x1), r1=253(y1), r2=84(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=60(y), r7=48(width), r8=32(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x), r11=144(y), r12=60(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 305
LDI r1, 253
LDI r2, 84
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 60
LDI r7, 48
LDI r8, 32
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 144
LDI r12, 60
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
