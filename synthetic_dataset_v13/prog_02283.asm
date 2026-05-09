; DESCRIPTION: Renders a white line between points (383, 214) and (434, 4).
; PLAN: r0=383(x1), r1=214(y1), r2=434(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 214
LDI r2, 434
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
