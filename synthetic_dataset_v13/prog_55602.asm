; DESCRIPTION: Composite: Creates a cyan circular shape at (352, 37) with radius 25 then Renders a white line between points (75, 220) and (268, 187) then Sets a single green pixel at (366, 99).
; PLAN: r0=352(x), r1=37(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x1), r6=220(y1), r7=268(x2), r8=187(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=366(x), r11=99(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 352
LDI r1, 37
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 220
LDI r7, 268
LDI r8, 187
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 99
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
