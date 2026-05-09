; DESCRIPTION: Composite: Places a red line segment connecting (164, 0) to (108, 129) then Places a magenta 64x12 rectangle at position (190, 39) then Sets a single yellow pixel at (495, 142).
; PLAN: r0=164(x1), r1=0(y1), r2=108(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=39(y), r7=64(width), r8=12(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=495(x), r11=142(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 0
LDI r2, 108
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 39
LDI r7, 64
LDI r8, 12
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 495
LDI r11, 142
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
