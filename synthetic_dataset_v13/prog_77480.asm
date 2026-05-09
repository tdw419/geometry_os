; DESCRIPTION: Composite: Sets a single yellow pixel at (96, 175) then Draws a white rectangle at (32, 21) with width 113 and height 19 then Draws a yellow line from (373, 34) to (209, 214).
; PLAN: r0=96(x), r1=175(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=32(x), r6=21(y), r7=113(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=373(x1), r11=34(y1), r12=209(x2), r13=214(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 175
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 32
LDI r6, 21
LDI r7, 113
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 34
LDI r12, 209
LDI r13, 214
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
