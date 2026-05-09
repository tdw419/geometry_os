; DESCRIPTION: Composite: Renders a orange disk with center (372, 205) and radius 43 then Creates a red rectangular region at (309, 26) spanning 60 by 18 pixels then Renders a green line between points (384, 21) and (79, 195).
; PLAN: r0=372(x), r1=205(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=26(y), r7=60(width), r8=18(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=384(x1), r11=21(y1), r12=79(x2), r13=195(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 372
LDI r1, 205
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 26
LDI r7, 60
LDI r8, 18
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 21
LDI r12, 79
LDI r13, 195
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
