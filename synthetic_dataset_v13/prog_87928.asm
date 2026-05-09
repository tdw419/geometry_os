; DESCRIPTION: Places a black line segment connecting (502, 205) to (387, 96).
; PLAN: r0=502(x1), r1=205(y1), r2=387(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 205
LDI r2, 387
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
