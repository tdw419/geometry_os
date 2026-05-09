; DESCRIPTION: Composite: Places a green line segment connecting (366, 130) to (399, 15) then Places a white 64x15 rectangle at position (37, 215) then Places a black dot at position (160, 229).
; PLAN: r0=366(x1), r1=130(y1), r2=399(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=215(y), r7=64(width), r8=15(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=160(x), r11=229(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 366
LDI r1, 130
LDI r2, 399
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 215
LDI r7, 64
LDI r8, 15
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 229
LDI r12, 0x000000
PSET r10, r11, r12
HALT
