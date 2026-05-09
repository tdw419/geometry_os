; DESCRIPTION: Composite: Renders a green box of size 57x63 starting at (365, 98) then Places a purple line segment connecting (241, 157) to (504, 114) then Sets a single green pixel at (202, 212).
; PLAN: r0=365(x), r1=98(y), r2=57(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x1), r6=157(y1), r7=504(x2), r8=114(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=212(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 365
LDI r1, 98
LDI r2, 57
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 157
LDI r7, 504
LDI r8, 114
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 212
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
