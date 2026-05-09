; DESCRIPTION: Composite: Renders a cyan box of size 59x56 starting at (9, 200) then Places a yellow dot at position (63, 145) then Draws a red line from (404, 7) to (465, 147).
; PLAN: r0=9(x), r1=200(y), r2=59(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=145(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=404(x1), r11=7(y1), r12=465(x2), r13=147(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 9
LDI r1, 200
LDI r2, 59
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 145
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 404
LDI r11, 7
LDI r12, 465
LDI r13, 147
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
