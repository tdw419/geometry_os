; DESCRIPTION: Composite: Renders a magenta box of size 26x81 starting at (176, 170) then Sets a single green pixel at (355, 121) then Renders a cyan line between points (455, 65) and (71, 113).
; PLAN: r0=176(x), r1=170(y), r2=26(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=121(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=455(x1), r11=65(y1), r12=71(x2), r13=113(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 170
LDI r2, 26
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 121
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 455
LDI r11, 65
LDI r12, 71
LDI r13, 113
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
