; DESCRIPTION: Composite: Renders a cyan line between points (392, 28) and (350, 103) then Creates a magenta rectangular region at (55, 92) spanning 12 by 40 pixels then Sets a single black pixel at (460, 202).
; PLAN: r0=392(x1), r1=28(y1), r2=350(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=92(y), r7=12(width), r8=40(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=460(x), r11=202(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 28
LDI r2, 350
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 92
LDI r7, 12
LDI r8, 40
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 202
LDI r12, 0x000000
PSET r10, r11, r12
HALT
