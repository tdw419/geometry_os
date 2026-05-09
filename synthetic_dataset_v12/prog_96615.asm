; DESCRIPTION: Composite: Draws a cyan circle centered at (295, 110) with radius 77 then Draws a red rectangle at (19, 74) with width 20 and height 18 then Draws a purple line from (167, 210) to (484, 70).
; PLAN: r0=295(x), r1=110(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x), r6=74(y), r7=20(width), r8=18(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=167(x1), r11=210(y1), r12=484(x2), r13=70(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 295
LDI r1, 110
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 74
LDI r7, 20
LDI r8, 18
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 210
LDI r12, 484
LDI r13, 70
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
