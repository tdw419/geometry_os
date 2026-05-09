; DESCRIPTION: Composite: Renders a blue line between points (417, 50) and (269, 193) then Renders a magenta box of size 58x107 starting at (114, 114) then Sets a single magenta pixel at (46, 81).
; PLAN: r0=417(x1), r1=50(y1), r2=269(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=114(y), r7=58(width), r8=107(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x), r11=81(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 417
LDI r1, 50
LDI r2, 269
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 114
LDI r7, 58
LDI r8, 107
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 81
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
