; DESCRIPTION: Composite: Creates a magenta circular shape at (323, 112) with radius 72 then Draws a black line from (403, 171) to (95, 253).
; PLAN: r0=323(x), r1=112(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x1), r6=171(y1), r7=95(x2), r8=253(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 112
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 171
LDI r7, 95
LDI r8, 253
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
