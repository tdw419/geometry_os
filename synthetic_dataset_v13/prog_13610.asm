; DESCRIPTION: Composite: Creates a white rectangular region at (106, 151) spanning 38 by 64 pixels then Renders a white line between points (132, 69) and (18, 105) then Places a red dot at position (212, 17).
; PLAN: r0=106(x), r1=151(y), r2=38(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x1), r6=69(y1), r7=18(x2), r8=105(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=212(x), r11=17(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 106
LDI r1, 151
LDI r2, 38
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 69
LDI r7, 18
LDI r8, 105
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 17
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
