; DESCRIPTION: Composite: Renders a orange box of size 90x47 starting at (307, 151) then Sets a single green pixel at (252, 39) then Renders a red line between points (26, 81) and (267, 54).
; PLAN: r0=307(x), r1=151(y), r2=90(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=39(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=26(x1), r11=81(y1), r12=267(x2), r13=54(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 151
LDI r2, 90
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 39
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 26
LDI r11, 81
LDI r12, 267
LDI r13, 54
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
