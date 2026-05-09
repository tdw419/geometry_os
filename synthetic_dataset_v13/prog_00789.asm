; DESCRIPTION: Composite: Sets a single magenta pixel at (188, 48) then Renders a cyan line between points (311, 114) and (384, 86) then Renders a magenta box of size 19x62 starting at (302, 142).
; PLAN: r0=188(x), r1=48(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=311(x1), r6=114(y1), r7=384(x2), r8=86(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=142(y), r12=19(width), r13=62(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 48
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 311
LDI r6, 114
LDI r7, 384
LDI r8, 86
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 142
LDI r12, 19
LDI r13, 62
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
