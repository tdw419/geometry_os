; DESCRIPTION: Renders a green line between points (434, 82) and (409, 59).
; PLAN: r0=434(x1), r1=82(y1), r2=409(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 82
LDI r2, 409
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
