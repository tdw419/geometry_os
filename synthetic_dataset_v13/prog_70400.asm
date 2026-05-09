; DESCRIPTION: Draws a cyan line from (36, 13) to (204, 150).
; PLAN: r0=36(x1), r1=13(y1), r2=204(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 13
LDI r2, 204
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
