; DESCRIPTION: Composite: Places a purple dot at position (511, 129) then Places a black circle of radius 53 at center (131, 156) then Draws a magenta line from (388, 246) to (273, 228).
; PLAN: r0=511(x), r1=129(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=156(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=388(x1), r11=246(y1), r12=273(x2), r13=228(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 511
LDI r1, 129
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 156
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 388
LDI r11, 246
LDI r12, 273
LDI r13, 228
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
