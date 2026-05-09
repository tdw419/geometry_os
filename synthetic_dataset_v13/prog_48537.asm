; DESCRIPTION: Renders a cyan line between points (419, 168) and (506, 60).
; PLAN: r0=419(x1), r1=168(y1), r2=506(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 168
LDI r2, 506
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
