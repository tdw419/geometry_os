; DESCRIPTION: Composite: Draws a yellow line from (382, 73) to (82, 193) then Renders a black disk with center (145, 126) and radius 39.
; PLAN: r0=382(x1), r1=73(y1), r2=82(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=126(y), r7=39(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 382
LDI r1, 73
LDI r2, 82
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 126
LDI r7, 39
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
