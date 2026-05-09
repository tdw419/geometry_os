; DESCRIPTION: Composite: Places a magenta dot at position (342, 166) then Draws a magenta circle centered at (337, 82) with radius 78 then Renders a red line between points (152, 186) and (82, 33).
; PLAN: r0=342(x), r1=166(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=337(x), r6=82(y), r7=78(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=152(x1), r11=186(y1), r12=82(x2), r13=33(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 166
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 337
LDI r6, 82
LDI r7, 78
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 152
LDI r11, 186
LDI r12, 82
LDI r13, 33
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
