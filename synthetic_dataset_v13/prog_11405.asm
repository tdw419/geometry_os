; DESCRIPTION: Composite: Places a cyan 71x59 rectangle at position (307, 127) then Renders a blue line between points (286, 182) and (100, 7) then Places a purple circle of radius 78 at center (113, 97).
; PLAN: r0=307(x), r1=127(y), r2=71(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x1), r6=182(y1), r7=100(x2), r8=7(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=113(x), r11=97(y), r12=78(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 127
LDI r2, 71
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 182
LDI r7, 100
LDI r8, 7
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 97
LDI r12, 78
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
