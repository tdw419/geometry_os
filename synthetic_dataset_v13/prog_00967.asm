; DESCRIPTION: Composite: Places a magenta line segment connecting (341, 252) to (42, 62) then Places a white dot at position (245, 146).
; PLAN: r0=341(x1), r1=252(y1), r2=42(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=146(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 341
LDI r1, 252
LDI r2, 42
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 146
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
