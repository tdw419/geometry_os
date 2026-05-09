; DESCRIPTION: Composite: Places a orange dot at position (388, 117) then Draws a yellow line from (242, 79) to (279, 42) then Draws a magenta circle centered at (448, 114) with radius 13.
; PLAN: r0=388(x), r1=117(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=242(x1), r6=79(y1), r7=279(x2), r8=42(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=448(x), r11=114(y), r12=13(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 388
LDI r1, 117
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 242
LDI r6, 79
LDI r7, 279
LDI r8, 42
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 114
LDI r12, 13
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
