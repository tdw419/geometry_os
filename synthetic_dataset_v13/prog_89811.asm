; DESCRIPTION: Composite: Renders a magenta line between points (62, 191) and (164, 192) then Renders a cyan box of size 105x35 starting at (65, 19) then Places a blue dot at position (5, 166).
; PLAN: r0=62(x1), r1=191(y1), r2=164(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=19(y), r7=105(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=5(x), r11=166(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 62
LDI r1, 191
LDI r2, 164
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 19
LDI r7, 105
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 166
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
