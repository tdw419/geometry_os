; DESCRIPTION: Composite: Renders a orange disk with center (330, 74) and radius 16 then Places a white line segment connecting (187, 244) to (269, 229) then Places a purple dot at position (18, 77).
; PLAN: r0=330(x), r1=74(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x1), r6=244(y1), r7=269(x2), r8=229(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=18(x), r11=77(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 330
LDI r1, 74
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 244
LDI r7, 269
LDI r8, 229
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 77
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
