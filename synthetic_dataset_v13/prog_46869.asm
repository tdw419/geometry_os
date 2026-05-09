; DESCRIPTION: Composite: Draws a magenta line from (276, 8) to (383, 221) then Places a blue circle of radius 22 at center (168, 42) then Sets a single black pixel at (405, 41).
; PLAN: r0=276(x1), r1=8(y1), r2=383(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=42(y), r7=22(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=405(x), r11=41(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 276
LDI r1, 8
LDI r2, 383
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 42
LDI r7, 22
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 405
LDI r11, 41
LDI r12, 0x000000
PSET r10, r11, r12
HALT
