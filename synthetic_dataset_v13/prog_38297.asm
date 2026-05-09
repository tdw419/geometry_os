; DESCRIPTION: Composite: Creates a red rectangular region at (98, 171) spanning 91 by 85 pixels then Renders a orange line between points (412, 7) and (227, 98) then Sets a single white pixel at (370, 255).
; PLAN: r0=98(x), r1=171(y), r2=91(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x1), r6=7(y1), r7=227(x2), r8=98(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=370(x), r11=255(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 98
LDI r1, 171
LDI r2, 91
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 7
LDI r7, 227
LDI r8, 98
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 255
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
