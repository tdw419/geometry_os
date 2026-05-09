; DESCRIPTION: Composite: Creates a orange rectangular region at (115, 149) spanning 75 by 102 pixels then Places a yellow line segment connecting (79, 203) to (211, 79) then Places a white dot at position (502, 10).
; PLAN: r0=115(x), r1=149(y), r2=75(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x1), r6=203(y1), r7=211(x2), r8=79(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=502(x), r11=10(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 115
LDI r1, 149
LDI r2, 75
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 203
LDI r7, 211
LDI r8, 79
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 502
LDI r11, 10
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
