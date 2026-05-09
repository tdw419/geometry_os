; DESCRIPTION: Composite: Renders a red line between points (431, 188) and (400, 82) then Places a green dot at position (403, 72).
; PLAN: r0=431(x1), r1=188(y1), r2=400(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=72(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 431
LDI r1, 188
LDI r2, 400
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 72
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
