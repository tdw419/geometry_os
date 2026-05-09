; DESCRIPTION: Composite: Renders a yellow line between points (1, 223) and (19, 95) then Places a white 45x10 rectangle at position (245, 132) then Sets a single purple pixel at (445, 78).
; PLAN: r0=1(x1), r1=223(y1), r2=19(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=132(y), r7=45(width), r8=10(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=445(x), r11=78(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 1
LDI r1, 223
LDI r2, 19
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 132
LDI r7, 45
LDI r8, 10
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 78
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
