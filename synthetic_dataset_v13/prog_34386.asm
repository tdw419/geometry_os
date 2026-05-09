; DESCRIPTION: Composite: Places a green dot at position (183, 37) then Creates a black rectangular region at (183, 64) spanning 115 by 62 pixels then Renders a cyan line between points (157, 20) and (210, 130).
; PLAN: r0=183(x), r1=37(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=64(y), r7=115(width), r8=62(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=157(x1), r11=20(y1), r12=210(x2), r13=130(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 37
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 183
LDI r6, 64
LDI r7, 115
LDI r8, 62
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 20
LDI r12, 210
LDI r13, 130
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
