; DESCRIPTION: Composite: Draws a yellow rectangle at (352, 214) with width 10 and height 37 then Places a green line segment connecting (56, 48) to (501, 134) then Sets a single cyan pixel at (500, 31).
; PLAN: r0=352(x), r1=214(y), r2=10(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x1), r6=48(y1), r7=501(x2), r8=134(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=500(x), r11=31(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 352
LDI r1, 214
LDI r2, 10
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 48
LDI r7, 501
LDI r8, 134
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 500
LDI r11, 31
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
