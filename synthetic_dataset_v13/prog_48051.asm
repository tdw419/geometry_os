; DESCRIPTION: Composite: Renders a green box of size 51x30 starting at (255, 184) then Renders a orange line between points (273, 105) and (228, 180) then Places a blue dot at position (308, 128).
; PLAN: r0=255(x), r1=184(y), r2=51(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x1), r6=105(y1), r7=228(x2), r8=180(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=128(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 184
LDI r2, 51
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 105
LDI r7, 228
LDI r8, 180
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 128
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
