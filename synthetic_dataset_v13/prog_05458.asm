; DESCRIPTION: Composite: Draws a blue rectangle at (189, 28) with width 116 and height 111 then Draws a cyan line from (423, 241) to (459, 20) then Places a green dot at position (447, 155).
; PLAN: r0=189(x), r1=28(y), r2=116(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x1), r6=241(y1), r7=459(x2), r8=20(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=447(x), r11=155(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 189
LDI r1, 28
LDI r2, 116
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 241
LDI r7, 459
LDI r8, 20
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 155
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
