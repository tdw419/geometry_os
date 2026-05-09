; DESCRIPTION: Composite: Sets a single cyan pixel at (212, 132) then Renders a purple box of size 14x67 starting at (202, 51) then Places a green line segment connecting (167, 49) to (448, 138).
; PLAN: r0=212(x), r1=132(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=51(y), r7=14(width), r8=67(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=167(x1), r11=49(y1), r12=448(x2), r13=138(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 132
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 51
LDI r7, 14
LDI r8, 67
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 49
LDI r12, 448
LDI r13, 138
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
