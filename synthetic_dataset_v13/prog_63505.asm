; DESCRIPTION: Composite: Draws a magenta line from (382, 129) to (43, 221) then Sets a single purple pixel at (100, 230).
; PLAN: r0=382(x1), r1=129(y1), r2=43(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=230(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 382
LDI r1, 129
LDI r2, 43
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 230
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
