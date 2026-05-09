; DESCRIPTION: Composite: Renders a purple line between points (202, 22) and (321, 122) then Places a cyan dot at position (374, 166) then Renders a magenta box of size 54x81 starting at (266, 118).
; PLAN: r0=202(x1), r1=22(y1), r2=321(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=166(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=266(x), r11=118(y), r12=54(width), r13=81(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 22
LDI r2, 321
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 166
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 266
LDI r11, 118
LDI r12, 54
LDI r13, 81
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
