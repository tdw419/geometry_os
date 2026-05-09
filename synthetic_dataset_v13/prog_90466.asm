; DESCRIPTION: Composite: Draws a cyan rectangle at (90, 129) with width 120 and height 75 then Draws a orange line from (249, 44) to (150, 91) then Sets a single black pixel at (328, 81).
; PLAN: r0=90(x), r1=129(y), r2=120(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x1), r6=44(y1), r7=150(x2), r8=91(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=328(x), r11=81(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 90
LDI r1, 129
LDI r2, 120
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 44
LDI r7, 150
LDI r8, 91
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 81
LDI r12, 0x000000
PSET r10, r11, r12
HALT
