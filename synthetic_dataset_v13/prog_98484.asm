; DESCRIPTION: Composite: Draws a blue line from (186, 184) to (232, 241) then Renders a white box of size 120x52 starting at (300, 70) then Places a blue dot at position (23, 108).
; PLAN: r0=186(x1), r1=184(y1), r2=232(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=70(y), r7=120(width), r8=52(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=23(x), r11=108(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 186
LDI r1, 184
LDI r2, 232
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 70
LDI r7, 120
LDI r8, 52
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 108
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
