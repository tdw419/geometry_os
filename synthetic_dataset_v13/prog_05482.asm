; DESCRIPTION: Composite: Sets a single red pixel at (493, 178) then Draws a cyan line from (435, 202) to (313, 142) then Draws a red rectangle at (152, 45) with width 74 and height 93.
; PLAN: r0=493(x), r1=178(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=435(x1), r6=202(y1), r7=313(x2), r8=142(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=152(x), r11=45(y), r12=74(width), r13=93(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 178
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 435
LDI r6, 202
LDI r7, 313
LDI r8, 142
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 45
LDI r12, 74
LDI r13, 93
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
