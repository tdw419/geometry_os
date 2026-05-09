; DESCRIPTION: Renders a red line between points (365, 249) and (307, 58).
; PLAN: r0=365(x1), r1=249(y1), r2=307(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 249
LDI r2, 307
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
