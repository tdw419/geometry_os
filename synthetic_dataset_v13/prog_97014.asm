; DESCRIPTION: Draws a cyan line from (333, 177) to (363, 4).
; PLAN: r0=333(x1), r1=177(y1), r2=363(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 177
LDI r2, 363
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
