; DESCRIPTION: Composite: Renders a black disk with center (212, 112) and radius 72 then Draws a blue line from (460, 73) to (305, 182).
; PLAN: r0=212(x), r1=112(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x1), r6=73(y1), r7=305(x2), r8=182(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 112
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 73
LDI r7, 305
LDI r8, 182
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
