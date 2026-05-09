; DESCRIPTION: Draws a cyan line from (27, 112) to (4, 80).
; PLAN: r0=27(x1), r1=112(y1), r2=4(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 112
LDI r2, 4
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
