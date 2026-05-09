; DESCRIPTION: Composite: Places a yellow dot at position (61, 191) then Renders a red line between points (80, 126) and (154, 168) then Creates a green rectangular region at (129, 143) spanning 94 by 66 pixels.
; PLAN: r0=61(x), r1=191(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=80(x1), r6=126(y1), r7=154(x2), r8=168(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=143(y), r12=94(width), r13=66(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 191
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 80
LDI r6, 126
LDI r7, 154
LDI r8, 168
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 143
LDI r12, 94
LDI r13, 66
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
