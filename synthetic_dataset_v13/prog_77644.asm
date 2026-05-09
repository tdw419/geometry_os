; DESCRIPTION: Composite: Renders a cyan line between points (494, 28) and (89, 191) then Renders a magenta box of size 23x29 starting at (68, 154) then Places a magenta dot at position (463, 35).
; PLAN: r0=494(x1), r1=28(y1), r2=89(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=154(y), r7=23(width), r8=29(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=463(x), r11=35(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 494
LDI r1, 28
LDI r2, 89
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 154
LDI r7, 23
LDI r8, 29
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 35
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
