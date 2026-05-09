; DESCRIPTION: Composite: Renders a purple box of size 119x36 starting at (48, 214) then Renders a magenta line between points (211, 177) and (85, 205) then Places a blue dot at position (157, 229).
; PLAN: r0=48(x), r1=214(y), r2=119(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x1), r6=177(y1), r7=85(x2), r8=205(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=157(x), r11=229(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 48
LDI r1, 214
LDI r2, 119
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 177
LDI r7, 85
LDI r8, 205
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 229
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
