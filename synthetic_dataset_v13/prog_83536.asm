; DESCRIPTION: Renders a red line between points (156, 66) and (502, 198).
; PLAN: r0=156(x1), r1=66(y1), r2=502(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 66
LDI r2, 502
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
