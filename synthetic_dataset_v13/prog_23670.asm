; DESCRIPTION: Composite: Creates a cyan circular shape at (209, 114) with radius 16 then Sets a single purple pixel at (457, 115) then Places a yellow line segment connecting (492, 240) to (192, 186).
; PLAN: r0=209(x), r1=114(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=115(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=492(x1), r11=240(y1), r12=192(x2), r13=186(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 114
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 115
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 492
LDI r11, 240
LDI r12, 192
LDI r13, 186
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
