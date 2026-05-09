; DESCRIPTION: Places a cyan line segment connecting (80, 200) to (387, 253).
; PLAN: r0=80(x1), r1=200(y1), r2=387(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 200
LDI r2, 387
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
