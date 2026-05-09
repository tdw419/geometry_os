; DESCRIPTION: Composite: Creates a cyan circular shape at (107, 132) with radius 74 then Places a yellow line segment connecting (321, 143) to (398, 221) then Sets a single white pixel at (154, 245).
; PLAN: r0=107(x), r1=132(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x1), r6=143(y1), r7=398(x2), r8=221(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=154(x), r11=245(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 107
LDI r1, 132
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 143
LDI r7, 398
LDI r8, 221
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 245
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
