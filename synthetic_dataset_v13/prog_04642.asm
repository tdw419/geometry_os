; DESCRIPTION: Composite: Places a magenta circle of radius 68 at center (113, 86) then Sets a single purple pixel at (225, 139) then Places a cyan line segment connecting (14, 109) to (226, 242).
; PLAN: r0=113(x), r1=86(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=139(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=14(x1), r11=109(y1), r12=226(x2), r13=242(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 86
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 139
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 14
LDI r11, 109
LDI r12, 226
LDI r13, 242
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
