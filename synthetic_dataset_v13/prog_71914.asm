; DESCRIPTION: Composite: Places a cyan dot at position (102, 119) then Renders a blue line between points (111, 94) and (267, 168) then Draws a blue rectangle at (71, 156) with width 47 and height 75.
; PLAN: r0=102(x), r1=119(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=111(x1), r6=94(y1), r7=267(x2), r8=168(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=71(x), r11=156(y), r12=47(width), r13=75(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 119
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 111
LDI r6, 94
LDI r7, 267
LDI r8, 168
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 156
LDI r12, 47
LDI r13, 75
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
