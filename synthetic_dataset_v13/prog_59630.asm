; DESCRIPTION: Composite: Creates a black rectangular region at (16, 136) spanning 66 by 57 pixels then Places a cyan line segment connecting (30, 248) to (500, 67) then Sets a single cyan pixel at (35, 19).
; PLAN: r0=16(x), r1=136(y), r2=66(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=30(x1), r6=248(y1), r7=500(x2), r8=67(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=35(x), r11=19(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 16
LDI r1, 136
LDI r2, 66
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 248
LDI r7, 500
LDI r8, 67
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 19
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
