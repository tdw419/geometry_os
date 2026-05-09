; DESCRIPTION: Composite: Creates a cyan circular shape at (285, 140) with radius 46 then Places a green line segment connecting (117, 132) to (357, 92) then Sets a single purple pixel at (505, 42).
; PLAN: r0=285(x), r1=140(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x1), r6=132(y1), r7=357(x2), r8=92(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=505(x), r11=42(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 140
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 132
LDI r7, 357
LDI r8, 92
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 505
LDI r11, 42
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
