; DESCRIPTION: Composite: Draws a cyan circle centered at (255, 202) with radius 15 then Draws a red line from (492, 225) to (444, 237) then Places a cyan 65x66 rectangle at position (208, 41).
; PLAN: r0=255(x), r1=202(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x1), r6=225(y1), r7=444(x2), r8=237(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=208(x), r11=41(y), r12=65(width), r13=66(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 202
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 225
LDI r7, 444
LDI r8, 237
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 41
LDI r12, 65
LDI r13, 66
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
