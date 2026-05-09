; DESCRIPTION: Composite: Places a yellow 51x40 rectangle at position (393, 7) then Places a green line segment connecting (356, 216) to (90, 254) then Sets a single purple pixel at (145, 166).
; PLAN: r0=393(x), r1=7(y), r2=51(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x1), r6=216(y1), r7=90(x2), r8=254(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=166(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 7
LDI r2, 51
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 216
LDI r7, 90
LDI r8, 254
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 166
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
