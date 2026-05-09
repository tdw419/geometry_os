; DESCRIPTION: Renders a red line between points (392, 124) and (36, 193).
; PLAN: r0=392(x1), r1=124(y1), r2=36(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 124
LDI r2, 36
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
