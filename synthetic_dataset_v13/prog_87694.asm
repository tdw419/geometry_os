; DESCRIPTION: Composite: Renders a blue line between points (33, 233) and (278, 205) then Renders a green box of size 25x31 starting at (460, 203) then Sets a single cyan pixel at (339, 198).
; PLAN: r0=33(x1), r1=233(y1), r2=278(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=460(x), r6=203(y), r7=25(width), r8=31(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=339(x), r11=198(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 33
LDI r1, 233
LDI r2, 278
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 203
LDI r7, 25
LDI r8, 31
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 198
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
