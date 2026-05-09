; DESCRIPTION: Composite: Sets a single purple pixel at (299, 211) then Places a magenta circle of radius 72 at center (401, 98) then Draws a green line from (190, 253) to (155, 50).
; PLAN: r0=299(x), r1=211(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=401(x), r6=98(y), r7=72(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=190(x1), r11=253(y1), r12=155(x2), r13=50(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 211
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 401
LDI r6, 98
LDI r7, 72
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 190
LDI r11, 253
LDI r12, 155
LDI r13, 50
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
