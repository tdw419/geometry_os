; DESCRIPTION: Renders a cyan line between points (487, 145) and (236, 233).
; PLAN: r0=487(x1), r1=145(y1), r2=236(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 145
LDI r2, 236
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
