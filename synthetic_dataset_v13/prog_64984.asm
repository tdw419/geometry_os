; DESCRIPTION: Composite: Sets a single blue pixel at (93, 135) then Creates a yellow rectangular region at (346, 138) spanning 59 by 19 pixels then Draws a cyan line from (269, 49) to (186, 208).
; PLAN: r0=93(x), r1=135(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=138(y), r7=59(width), r8=19(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x1), r11=49(y1), r12=186(x2), r13=208(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 135
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 346
LDI r6, 138
LDI r7, 59
LDI r8, 19
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 49
LDI r12, 186
LDI r13, 208
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
