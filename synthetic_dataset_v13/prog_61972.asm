; DESCRIPTION: Renders a magenta line between points (265, 249) and (465, 241).
; PLAN: r0=265(x1), r1=249(y1), r2=465(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 249
LDI r2, 465
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
