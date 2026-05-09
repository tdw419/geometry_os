; DESCRIPTION: Renders a cyan line between points (419, 60) and (230, 196).
; PLAN: r0=419(x1), r1=60(y1), r2=230(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 60
LDI r2, 230
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
