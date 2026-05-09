; DESCRIPTION: Composite: Places a cyan dot at position (453, 67) then Creates a magenta rectangular region at (340, 85) spanning 84 by 65 pixels then Draws a yellow line from (431, 25) to (211, 220).
; PLAN: r0=453(x), r1=67(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=85(y), r7=84(width), r8=65(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=431(x1), r11=25(y1), r12=211(x2), r13=220(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 67
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 340
LDI r6, 85
LDI r7, 84
LDI r8, 65
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 25
LDI r12, 211
LDI r13, 220
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
