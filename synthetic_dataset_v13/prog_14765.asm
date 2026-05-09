; DESCRIPTION: Composite: Places a blue line segment connecting (250, 84) to (193, 168) then Draws a white rectangle at (303, 135) with width 100 and height 54 then Places a white dot at position (504, 80).
; PLAN: r0=250(x1), r1=84(y1), r2=193(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=135(y), r7=100(width), r8=54(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=504(x), r11=80(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 250
LDI r1, 84
LDI r2, 193
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 135
LDI r7, 100
LDI r8, 54
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 504
LDI r11, 80
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
