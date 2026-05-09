; DESCRIPTION: Composite: Places a orange dot at position (358, 58) then Draws a magenta line from (54, 111) to (453, 246) then Renders a red disk with center (275, 143) and radius 46.
; PLAN: r0=358(x), r1=58(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=54(x1), r6=111(y1), r7=453(x2), r8=246(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=275(x), r11=143(y), r12=46(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 358
LDI r1, 58
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 54
LDI r6, 111
LDI r7, 453
LDI r8, 246
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 143
LDI r12, 46
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
