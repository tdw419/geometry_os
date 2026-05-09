; DESCRIPTION: Composite: Draws a white line from (480, 222) to (464, 58) then Draws a purple rectangle at (365, 97) with width 21 and height 47.
; PLAN: r0=480(x1), r1=222(y1), r2=464(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=97(y), r7=21(width), r8=47(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 222
LDI r2, 464
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 97
LDI r7, 21
LDI r8, 47
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
