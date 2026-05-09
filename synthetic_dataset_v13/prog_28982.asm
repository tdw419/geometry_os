; DESCRIPTION: Composite: Places a cyan circle of radius 43 at center (124, 79) then Renders a magenta line between points (219, 252) and (172, 67) then Places a cyan dot at position (158, 177).
; PLAN: r0=124(x), r1=79(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x1), r6=252(y1), r7=172(x2), r8=67(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=158(x), r11=177(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 124
LDI r1, 79
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 252
LDI r7, 172
LDI r8, 67
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 177
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
