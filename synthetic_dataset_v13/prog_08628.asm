; DESCRIPTION: Renders a white line between points (168, 31) and (404, 51).
; PLAN: r0=168(x1), r1=31(y1), r2=404(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 31
LDI r2, 404
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
