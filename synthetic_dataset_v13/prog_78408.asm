; DESCRIPTION: Composite: Renders a yellow line between points (358, 138) and (499, 228) then Places a orange 34x80 rectangle at position (14, 81) then Places a green dot at position (354, 104).
; PLAN: r0=358(x1), r1=138(y1), r2=499(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=81(y), r7=34(width), r8=80(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=354(x), r11=104(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 358
LDI r1, 138
LDI r2, 499
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 81
LDI r7, 34
LDI r8, 80
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 104
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
