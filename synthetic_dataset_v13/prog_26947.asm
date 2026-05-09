; DESCRIPTION: Composite: Places a cyan line segment connecting (352, 208) to (345, 34) then Places a cyan dot at position (358, 217) then Draws a green rectangle at (405, 109) with width 28 and height 11.
; PLAN: r0=352(x1), r1=208(y1), r2=345(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=217(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=405(x), r11=109(y), r12=28(width), r13=11(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 208
LDI r2, 345
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 217
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 405
LDI r11, 109
LDI r12, 28
LDI r13, 11
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
