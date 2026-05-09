; DESCRIPTION: Composite: Places a magenta dot at position (383, 112) then Creates a red circular shape at (157, 190) with radius 26 then Draws a cyan line from (189, 191) to (139, 83).
; PLAN: r0=383(x), r1=112(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=157(x), r6=190(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=189(x1), r11=191(y1), r12=139(x2), r13=83(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 112
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 157
LDI r6, 190
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 189
LDI r11, 191
LDI r12, 139
LDI r13, 83
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
