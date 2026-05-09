; DESCRIPTION: Renders a black line between points (296, 98) and (404, 28).
; PLAN: r0=296(x1), r1=98(y1), r2=404(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 98
LDI r2, 404
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
