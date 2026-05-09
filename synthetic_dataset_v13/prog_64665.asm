; DESCRIPTION: Composite: Draws a cyan line from (126, 232) to (239, 58) then Draws a yellow rectangle at (298, 104) with width 19 and height 58 then Sets a single orange pixel at (243, 102).
; PLAN: r0=126(x1), r1=232(y1), r2=239(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=104(y), r7=19(width), r8=58(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=243(x), r11=102(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 126
LDI r1, 232
LDI r2, 239
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 104
LDI r7, 19
LDI r8, 58
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 102
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
