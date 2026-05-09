; DESCRIPTION: Renders a purple line between points (123, 82) and (380, 182).
; PLAN: r0=123(x1), r1=82(y1), r2=380(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 82
LDI r2, 380
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
