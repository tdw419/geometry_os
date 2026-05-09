; DESCRIPTION: Composite: Draws a white line from (439, 25) to (450, 37) then Draws a blue rectangle at (455, 56) with width 14 and height 108.
; PLAN: r0=439(x1), r1=25(y1), r2=450(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=56(y), r7=14(width), r8=108(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 25
LDI r2, 450
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 56
LDI r7, 14
LDI r8, 108
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
