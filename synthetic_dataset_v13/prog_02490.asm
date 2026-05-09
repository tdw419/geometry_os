; DESCRIPTION: Composite: Renders a green box of size 17x15 starting at (478, 71) then Renders a magenta line between points (450, 27) and (336, 8) then Places a purple dot at position (380, 212).
; PLAN: r0=478(x), r1=71(y), r2=17(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x1), r6=27(y1), r7=336(x2), r8=8(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=212(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 478
LDI r1, 71
LDI r2, 17
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 27
LDI r7, 336
LDI r8, 8
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 212
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
