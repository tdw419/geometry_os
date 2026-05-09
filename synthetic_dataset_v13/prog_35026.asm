; DESCRIPTION: Composite: Sets a single magenta pixel at (193, 39) then Renders a cyan line between points (92, 132) and (338, 114) then Creates a magenta rectangular region at (31, 88) spanning 83 by 113 pixels.
; PLAN: r0=193(x), r1=39(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=92(x1), r6=132(y1), r7=338(x2), r8=114(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=31(x), r11=88(y), r12=83(width), r13=113(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 39
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 92
LDI r6, 132
LDI r7, 338
LDI r8, 114
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 88
LDI r12, 83
LDI r13, 113
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
