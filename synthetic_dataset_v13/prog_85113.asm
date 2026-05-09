; DESCRIPTION: Composite: Creates a red circular shape at (407, 153) with radius 45 then Renders a cyan line between points (206, 243) and (330, 87) then Creates a magenta rectangular region at (414, 31) spanning 81 by 55 pixels.
; PLAN: r0=407(x), r1=153(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x1), r6=243(y1), r7=330(x2), r8=87(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=414(x), r11=31(y), r12=81(width), r13=55(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 153
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 243
LDI r7, 330
LDI r8, 87
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 31
LDI r12, 81
LDI r13, 55
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
