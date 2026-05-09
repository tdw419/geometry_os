; DESCRIPTION: Composite: Draws a orange rectangle at (482, 91) with width 24 and height 53 then Sets a single green pixel at (145, 255) then Draws a cyan line from (11, 39) to (56, 220).
; PLAN: r0=482(x), r1=91(y), r2=24(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=255(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=11(x1), r11=39(y1), r12=56(x2), r13=220(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 482
LDI r1, 91
LDI r2, 24
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 255
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 11
LDI r11, 39
LDI r12, 56
LDI r13, 220
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
