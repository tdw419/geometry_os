; DESCRIPTION: Composite: Renders a black box of size 21x87 starting at (460, 9) then Renders a blue line between points (271, 32) and (247, 188) then Places a black dot at position (94, 18).
; PLAN: r0=460(x), r1=9(y), r2=21(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x1), r6=32(y1), r7=247(x2), r8=188(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=94(x), r11=18(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 460
LDI r1, 9
LDI r2, 21
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 32
LDI r7, 247
LDI r8, 188
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 18
LDI r12, 0x000000
PSET r10, r11, r12
HALT
