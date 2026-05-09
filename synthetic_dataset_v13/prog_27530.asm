; DESCRIPTION: Composite: Renders a green disk with center (452, 114) and radius 47 then Creates a red rectangular region at (275, 49) spanning 113 by 110 pixels then Renders a cyan line between points (243, 13) and (267, 69).
; PLAN: r0=452(x), r1=114(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x), r6=49(y), r7=113(width), r8=110(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=243(x1), r11=13(y1), r12=267(x2), r13=69(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 114
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 49
LDI r7, 113
LDI r8, 110
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 13
LDI r12, 267
LDI r13, 69
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
