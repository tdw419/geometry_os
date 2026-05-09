; DESCRIPTION: Renders a red line between points (32, 21) and (329, 172).
; PLAN: r0=32(x1), r1=21(y1), r2=329(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 21
LDI r2, 329
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
