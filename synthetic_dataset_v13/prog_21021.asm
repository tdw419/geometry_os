; DESCRIPTION: Composite: Draws a blue rectangle at (266, 112) with width 67 and height 45 then Draws a yellow line from (464, 2) to (152, 203).
; PLAN: r0=266(x), r1=112(y), r2=67(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x1), r6=2(y1), r7=152(x2), r8=203(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 112
LDI r2, 67
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 2
LDI r7, 152
LDI r8, 203
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
