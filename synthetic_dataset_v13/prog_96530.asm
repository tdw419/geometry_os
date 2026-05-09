; DESCRIPTION: Places a cyan line segment connecting (51, 206) to (326, 96).
; PLAN: r0=51(x1), r1=206(y1), r2=326(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 206
LDI r2, 326
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
