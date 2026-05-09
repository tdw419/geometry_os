; DESCRIPTION: Composite: Renders a yellow box of size 41x87 starting at (190, 92) then Renders a magenta line between points (382, 228) and (341, 222) then Places a magenta dot at position (147, 87).
; PLAN: r0=190(x), r1=92(y), r2=41(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x1), r6=228(y1), r7=341(x2), r8=222(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=147(x), r11=87(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 92
LDI r2, 41
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 228
LDI r7, 341
LDI r8, 222
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 87
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
