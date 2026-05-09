; DESCRIPTION: Composite: Renders a black disk with center (287, 87) and radius 36 then Renders a magenta line between points (301, 46) and (387, 73).
; PLAN: r0=287(x), r1=87(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x1), r6=46(y1), r7=387(x2), r8=73(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 87
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 46
LDI r7, 387
LDI r8, 73
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
