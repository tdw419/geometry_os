; DESCRIPTION: Composite: Places a orange dot at position (466, 154) then Draws a magenta circle centered at (90, 168) with radius 79 then Renders a magenta line between points (47, 75) and (167, 115).
; PLAN: r0=466(x), r1=154(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=168(y), r7=79(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x1), r11=75(y1), r12=167(x2), r13=115(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 154
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 90
LDI r6, 168
LDI r7, 79
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 75
LDI r12, 167
LDI r13, 115
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
