; DESCRIPTION: Composite: Creates a purple rectangular region at (450, 34) spanning 54 by 32 pixels then Draws a magenta line from (82, 243) to (57, 188) then Sets a single black pixel at (101, 129).
; PLAN: r0=450(x), r1=34(y), r2=54(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x1), r6=243(y1), r7=57(x2), r8=188(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=129(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 450
LDI r1, 34
LDI r2, 54
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 243
LDI r7, 57
LDI r8, 188
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 129
LDI r12, 0x000000
PSET r10, r11, r12
HALT
