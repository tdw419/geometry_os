; DESCRIPTION: Composite: Sets a single white pixel at (52, 160) then Places a cyan line segment connecting (509, 42) to (236, 245) then Creates a cyan circular shape at (326, 212) with radius 41.
; PLAN: r0=52(x), r1=160(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=509(x1), r6=42(y1), r7=236(x2), r8=245(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=326(x), r11=212(y), r12=41(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 52
LDI r1, 160
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 509
LDI r6, 42
LDI r7, 236
LDI r8, 245
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 212
LDI r12, 41
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
