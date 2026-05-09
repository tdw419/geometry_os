; DESCRIPTION: Composite: Draws a white line from (198, 224) to (310, 2) then Draws a blue rectangle at (340, 53) with width 21 and height 66.
; PLAN: r0=198(x1), r1=224(y1), r2=310(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=53(y), r7=21(width), r8=66(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 224
LDI r2, 310
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 53
LDI r7, 21
LDI r8, 66
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
