; DESCRIPTION: Composite: Renders a cyan line between points (49, 172) and (19, 220) then Sets a single orange pixel at (212, 151) then Creates a white rectangular region at (208, 36) spanning 50 by 16 pixels.
; PLAN: r0=49(x1), r1=172(y1), r2=19(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=212(x), r6=151(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=208(x), r11=36(y), r12=50(width), r13=16(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 172
LDI r2, 19
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 151
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 208
LDI r11, 36
LDI r12, 50
LDI r13, 16
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
