; DESCRIPTION: Renders a yellow line between points (82, 214) and (410, 189).
; PLAN: r0=82(x1), r1=214(y1), r2=410(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 214
LDI r2, 410
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
