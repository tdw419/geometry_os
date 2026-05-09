; DESCRIPTION: Composite: Draws a blue rectangle at (133, 125) with width 63 and height 112 then Places a green line segment connecting (346, 37) to (4, 143).
; PLAN: r0=133(x), r1=125(y), r2=63(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x1), r6=37(y1), r7=4(x2), r8=143(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 125
LDI r2, 63
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 37
LDI r7, 4
LDI r8, 143
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
