; DESCRIPTION: Composite: Places a magenta dot at position (291, 28) then Places a cyan circle of radius 27 at center (319, 103) then Places a yellow line segment connecting (440, 84) to (66, 47).
; PLAN: r0=291(x), r1=28(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=103(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=440(x1), r11=84(y1), r12=66(x2), r13=47(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 28
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 103
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 440
LDI r11, 84
LDI r12, 66
LDI r13, 47
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
