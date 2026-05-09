; DESCRIPTION: Renders a cyan line between points (2, 85) and (221, 174).
; PLAN: r0=2(x1), r1=85(y1), r2=221(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 85
LDI r2, 221
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
