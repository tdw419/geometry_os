; DESCRIPTION: Composite: Draws a red line from (30, 239) to (37, 219) then Places a white 55x113 rectangle at position (60, 43) then Places a purple dot at position (466, 49).
; PLAN: r0=30(x1), r1=239(y1), r2=37(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=43(y), r7=55(width), r8=113(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=466(x), r11=49(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 30
LDI r1, 239
LDI r2, 37
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 43
LDI r7, 55
LDI r8, 113
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 49
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
