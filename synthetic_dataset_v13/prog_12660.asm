; DESCRIPTION: Composite: Places a blue line segment connecting (418, 220) to (300, 255) then Draws a black rectangle at (228, 71) with width 64 and height 84.
; PLAN: r0=418(x1), r1=220(y1), r2=300(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=228(x), r6=71(y), r7=64(width), r8=84(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 220
LDI r2, 300
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 71
LDI r7, 64
LDI r8, 84
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
