; DESCRIPTION: Composite: Places a cyan line segment connecting (42, 63) to (22, 104) then Places a white dot at position (337, 37).
; PLAN: r0=42(x1), r1=63(y1), r2=22(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=37(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 42
LDI r1, 63
LDI r2, 22
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 37
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
