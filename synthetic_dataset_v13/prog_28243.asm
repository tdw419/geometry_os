; DESCRIPTION: Composite: Creates a green rectangular region at (237, 65) spanning 118 by 43 pixels then Places a black dot at position (75, 190) then Renders a cyan line between points (501, 125) and (239, 173).
; PLAN: r0=237(x), r1=65(y), r2=118(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=190(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=501(x1), r11=125(y1), r12=239(x2), r13=173(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 65
LDI r2, 118
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 190
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 501
LDI r11, 125
LDI r12, 239
LDI r13, 173
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
