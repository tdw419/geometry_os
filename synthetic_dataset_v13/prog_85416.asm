; DESCRIPTION: Renders a red line between points (267, 128) and (420, 221).
; PLAN: r0=267(x1), r1=128(y1), r2=420(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 128
LDI r2, 420
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
