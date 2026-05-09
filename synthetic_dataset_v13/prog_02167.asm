; DESCRIPTION: Composite: Places a white 101x33 rectangle at position (218, 135) then Renders a cyan line between points (158, 24) and (257, 217) then Sets a single magenta pixel at (473, 229).
; PLAN: r0=218(x), r1=135(y), r2=101(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x1), r6=24(y1), r7=257(x2), r8=217(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=473(x), r11=229(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 135
LDI r2, 101
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 24
LDI r7, 257
LDI r8, 217
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 473
LDI r11, 229
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
