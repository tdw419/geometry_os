; DESCRIPTION: Composite: Places a cyan 95x60 rectangle at position (392, 184) then Renders a green line between points (76, 11) and (399, 98) then Sets a single magenta pixel at (345, 62).
; PLAN: r0=392(x), r1=184(y), r2=95(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x1), r6=11(y1), r7=399(x2), r8=98(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=345(x), r11=62(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 184
LDI r2, 95
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 11
LDI r7, 399
LDI r8, 98
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 62
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
