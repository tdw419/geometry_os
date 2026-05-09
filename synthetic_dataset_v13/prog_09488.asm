; DESCRIPTION: Draws a cyan line from (197, 6) to (36, 124).
; PLAN: r0=197(x1), r1=6(y1), r2=36(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 6
LDI r2, 36
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
