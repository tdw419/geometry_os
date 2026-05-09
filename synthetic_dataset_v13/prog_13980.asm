; DESCRIPTION: Composite: Sets a single purple pixel at (192, 211) then Places a black 53x19 rectangle at position (392, 209) then Places a black line segment connecting (343, 196) to (175, 248).
; PLAN: r0=192(x), r1=211(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=209(y), r7=53(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x1), r11=196(y1), r12=175(x2), r13=248(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 211
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 392
LDI r6, 209
LDI r7, 53
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 196
LDI r12, 175
LDI r13, 248
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
