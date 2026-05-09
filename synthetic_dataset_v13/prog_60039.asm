; DESCRIPTION: Composite: Sets a single white pixel at (367, 13) then Places a black line segment connecting (259, 242) to (111, 42) then Places a yellow circle of radius 64 at center (309, 93).
; PLAN: r0=367(x), r1=13(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=259(x1), r6=242(y1), r7=111(x2), r8=42(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=309(x), r11=93(y), r12=64(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 367
LDI r1, 13
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 259
LDI r6, 242
LDI r7, 111
LDI r8, 42
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 93
LDI r12, 64
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
