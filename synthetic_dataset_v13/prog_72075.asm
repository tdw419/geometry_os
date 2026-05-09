; DESCRIPTION: Composite: Creates a magenta rectangular region at (333, 10) spanning 106 by 59 pixels then Draws a green line from (420, 208) to (363, 234) then Places a purple dot at position (253, 77).
; PLAN: r0=333(x), r1=10(y), r2=106(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x1), r6=208(y1), r7=363(x2), r8=234(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=77(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 333
LDI r1, 10
LDI r2, 106
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 208
LDI r7, 363
LDI r8, 234
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 77
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
