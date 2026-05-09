; DESCRIPTION: Composite: Renders a cyan line between points (416, 210) and (222, 16) then Places a purple 26x94 rectangle at position (377, 118) then Places a yellow dot at position (180, 16).
; PLAN: r0=416(x1), r1=210(y1), r2=222(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=118(y), r7=26(width), r8=94(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=180(x), r11=16(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 210
LDI r2, 222
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 118
LDI r7, 26
LDI r8, 94
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 16
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
