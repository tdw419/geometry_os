; DESCRIPTION: Composite: Draws a purple rectangle at (81, 91) with width 44 and height 58 then Draws a cyan line from (278, 221) to (76, 78) then Sets a single green pixel at (391, 210).
; PLAN: r0=81(x), r1=91(y), r2=44(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x1), r6=221(y1), r7=76(x2), r8=78(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=210(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 91
LDI r2, 44
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 221
LDI r7, 76
LDI r8, 78
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 210
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
