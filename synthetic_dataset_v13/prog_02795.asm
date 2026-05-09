; DESCRIPTION: Draws a cyan line from (3, 200) to (392, 81).
; PLAN: r0=3(x1), r1=200(y1), r2=392(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 200
LDI r2, 392
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
