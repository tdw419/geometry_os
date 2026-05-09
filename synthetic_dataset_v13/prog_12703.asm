; DESCRIPTION: Renders a magenta line between points (502, 58) and (317, 8).
; PLAN: r0=502(x1), r1=58(y1), r2=317(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 58
LDI r2, 317
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
