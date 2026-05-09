; DESCRIPTION: Renders a magenta line between points (368, 253) and (333, 82).
; PLAN: r0=368(x1), r1=253(y1), r2=333(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 253
LDI r2, 333
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
