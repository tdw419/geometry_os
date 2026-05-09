; DESCRIPTION: Composite: Sets a single purple pixel at (382, 20) then Draws a cyan line from (493, 208) to (163, 7) then Draws a white rectangle at (62, 2) with width 18 and height 88.
; PLAN: r0=382(x), r1=20(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=493(x1), r6=208(y1), r7=163(x2), r8=7(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=62(x), r11=2(y), r12=18(width), r13=88(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 20
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 493
LDI r6, 208
LDI r7, 163
LDI r8, 7
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 2
LDI r12, 18
LDI r13, 88
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
