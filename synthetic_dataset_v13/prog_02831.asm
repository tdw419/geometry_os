; DESCRIPTION: Composite: Places a magenta dot at position (45, 191) then Draws a magenta rectangle at (324, 120) with width 21 and height 79 then Renders a magenta line between points (165, 169) and (168, 94).
; PLAN: r0=45(x), r1=191(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=120(y), r7=21(width), r8=79(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=165(x1), r11=169(y1), r12=168(x2), r13=94(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 191
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 120
LDI r7, 21
LDI r8, 79
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 169
LDI r12, 168
LDI r13, 94
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
