; DESCRIPTION: Composite: Places a black 47x112 rectangle at position (141, 129) then Places a cyan line segment connecting (60, 114) to (169, 130) then Sets a single yellow pixel at (205, 8).
; PLAN: r0=141(x), r1=129(y), r2=47(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x1), r6=114(y1), r7=169(x2), r8=130(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=205(x), r11=8(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 141
LDI r1, 129
LDI r2, 47
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 114
LDI r7, 169
LDI r8, 130
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 8
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
