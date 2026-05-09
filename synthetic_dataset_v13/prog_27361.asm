; DESCRIPTION: Composite: Renders a purple box of size 101x65 starting at (367, 97) then Places a magenta dot at position (194, 96) then Places a yellow line segment connecting (479, 129) to (62, 97).
; PLAN: r0=367(x), r1=97(y), r2=101(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=96(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=479(x1), r11=129(y1), r12=62(x2), r13=97(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 97
LDI r2, 101
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 96
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 479
LDI r11, 129
LDI r12, 62
LDI r13, 97
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
