; DESCRIPTION: Composite: Places a red 120x73 rectangle at position (326, 180) then Renders a green line between points (29, 119) and (91, 155) then Sets a single orange pixel at (337, 189).
; PLAN: r0=326(x), r1=180(y), r2=120(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=29(x1), r6=119(y1), r7=91(x2), r8=155(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=337(x), r11=189(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 180
LDI r2, 120
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 119
LDI r7, 91
LDI r8, 155
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 189
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
