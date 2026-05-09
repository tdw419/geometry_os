; DESCRIPTION: Composite: Creates a orange circular shape at (330, 118) with radius 37 then Renders a cyan line between points (207, 243) and (336, 122) then Sets a single cyan pixel at (352, 227).
; PLAN: r0=330(x), r1=118(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x1), r6=243(y1), r7=336(x2), r8=122(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=352(x), r11=227(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 330
LDI r1, 118
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 243
LDI r7, 336
LDI r8, 122
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 227
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
