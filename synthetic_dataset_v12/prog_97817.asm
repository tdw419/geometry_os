; DESCRIPTION: Composite: Renders a black line between points (81, 233) and (16, 65) then Places a orange 90x43 rectangle at position (335, 52) then Places a cyan dot at position (258, 220).
; PLAN: r0=81(x1), r1=233(y1), r2=16(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=52(y), r7=90(width), r8=43(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x), r11=220(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 233
LDI r2, 16
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 52
LDI r7, 90
LDI r8, 43
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 220
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
