; DESCRIPTION: Composite: Sets a single cyan pixel at (251, 74) then Draws a orange rectangle at (463, 128) with width 39 and height 104 then Renders a blue line between points (76, 217) and (101, 104).
; PLAN: r0=251(x), r1=74(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=463(x), r6=128(y), r7=39(width), r8=104(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x1), r11=217(y1), r12=101(x2), r13=104(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 74
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 463
LDI r6, 128
LDI r7, 39
LDI r8, 104
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 217
LDI r12, 101
LDI r13, 104
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
