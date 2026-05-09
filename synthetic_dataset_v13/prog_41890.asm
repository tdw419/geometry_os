; DESCRIPTION: Composite: Renders a red line between points (429, 193) and (491, 140) then Places a cyan 74x113 rectangle at position (43, 109) then Places a red dot at position (124, 192).
; PLAN: r0=429(x1), r1=193(y1), r2=491(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=109(y), r7=74(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=124(x), r11=192(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 429
LDI r1, 193
LDI r2, 491
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 109
LDI r7, 74
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 192
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
