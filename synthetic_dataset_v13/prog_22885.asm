; DESCRIPTION: Renders a cyan line between points (400, 48) and (383, 100).
; PLAN: r0=400(x1), r1=48(y1), r2=383(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 48
LDI r2, 383
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
