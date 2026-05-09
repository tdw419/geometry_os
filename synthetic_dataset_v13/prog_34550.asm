; DESCRIPTION: Draws a cyan line from (325, 132) to (279, 120).
; PLAN: r0=325(x1), r1=132(y1), r2=279(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 132
LDI r2, 279
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
