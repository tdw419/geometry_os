; DESCRIPTION: Renders a green line between points (365, 82) and (418, 246).
; PLAN: r0=365(x1), r1=82(y1), r2=418(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 82
LDI r2, 418
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
