; DESCRIPTION: Composite: Places a yellow dot at position (26, 27) then Draws a white rectangle at (450, 103) with width 14 and height 33 then Draws a magenta line from (441, 211) to (261, 127).
; PLAN: r0=26(x), r1=27(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=103(y), r7=14(width), r8=33(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x1), r11=211(y1), r12=261(x2), r13=127(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 27
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 450
LDI r6, 103
LDI r7, 14
LDI r8, 33
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 211
LDI r12, 261
LDI r13, 127
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
