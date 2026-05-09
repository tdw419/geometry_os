; DESCRIPTION: Composite: Renders a orange disk with center (313, 146) and radius 77 then Places a green line segment connecting (26, 13) to (19, 205) then Places a red dot at position (39, 79).
; PLAN: r0=313(x), r1=146(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x1), r6=13(y1), r7=19(x2), r8=205(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=39(x), r11=79(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 313
LDI r1, 146
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 13
LDI r7, 19
LDI r8, 205
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 79
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
