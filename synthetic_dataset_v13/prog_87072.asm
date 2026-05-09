; DESCRIPTION: Composite: Draws a white rectangle at (284, 2) with width 59 and height 72 then Places a green line segment connecting (407, 147) to (316, 35).
; PLAN: r0=284(x), r1=2(y), r2=59(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x1), r6=147(y1), r7=316(x2), r8=35(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 2
LDI r2, 59
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 147
LDI r7, 316
LDI r8, 35
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
