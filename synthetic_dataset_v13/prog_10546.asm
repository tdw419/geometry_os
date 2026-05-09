; DESCRIPTION: Composite: Renders a green line between points (485, 6) and (175, 202) then Places a green 88x23 rectangle at position (191, 52) then Sets a single cyan pixel at (30, 116).
; PLAN: r0=485(x1), r1=6(y1), r2=175(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=52(y), r7=88(width), r8=23(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=30(x), r11=116(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 485
LDI r1, 6
LDI r2, 175
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 52
LDI r7, 88
LDI r8, 23
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 116
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
