; DESCRIPTION: Composite: Places a cyan dot at position (382, 122) then Draws a orange rectangle at (290, 66) with width 67 and height 19 then Places a purple line segment connecting (320, 140) to (385, 66).
; PLAN: r0=382(x), r1=122(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=66(y), r7=67(width), r8=19(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x1), r11=140(y1), r12=385(x2), r13=66(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 122
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 290
LDI r6, 66
LDI r7, 67
LDI r8, 19
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 140
LDI r12, 385
LDI r13, 66
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
