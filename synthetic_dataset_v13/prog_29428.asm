; DESCRIPTION: Composite: Renders a cyan line between points (245, 187) and (370, 9) then Places a green circle of radius 26 at center (292, 125) then Creates a red rectangular region at (259, 120) spanning 21 by 61 pixels.
; PLAN: r0=245(x1), r1=187(y1), r2=370(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=125(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=259(x), r11=120(y), r12=21(width), r13=61(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 187
LDI r2, 370
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 125
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 259
LDI r11, 120
LDI r12, 21
LDI r13, 61
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
