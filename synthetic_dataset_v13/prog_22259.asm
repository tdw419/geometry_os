; DESCRIPTION: Composite: Places a black 87x52 rectangle at position (67, 43) then Places a cyan line segment connecting (194, 43) to (394, 8) then Places a orange dot at position (368, 100).
; PLAN: r0=67(x), r1=43(y), r2=87(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x1), r6=43(y1), r7=394(x2), r8=8(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=368(x), r11=100(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 67
LDI r1, 43
LDI r2, 87
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 43
LDI r7, 394
LDI r8, 8
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 100
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
