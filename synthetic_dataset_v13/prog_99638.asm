; DESCRIPTION: Draws a cyan line from (323, 220) to (279, 81).
; PLAN: r0=323(x1), r1=220(y1), r2=279(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 220
LDI r2, 279
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
