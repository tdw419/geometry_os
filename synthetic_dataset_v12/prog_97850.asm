; DESCRIPTION: Composite: Draws a white line from (160, 149) to (203, 30) then Places a cyan circle of radius 67 at center (413, 141) then Places a red dot at position (268, 76).
; PLAN: r0=160(x1), r1=149(y1), r2=203(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=141(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=268(x), r11=76(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 160
LDI r1, 149
LDI r2, 203
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 141
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 268
LDI r11, 76
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
