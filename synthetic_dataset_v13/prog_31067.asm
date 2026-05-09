; DESCRIPTION: Composite: Draws a yellow line from (429, 221) to (82, 121) then Renders a orange disk with center (124, 183) and radius 48.
; PLAN: r0=429(x1), r1=221(y1), r2=82(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=183(y), r7=48(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 429
LDI r1, 221
LDI r2, 82
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 183
LDI r7, 48
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
