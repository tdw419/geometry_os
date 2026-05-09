; DESCRIPTION: Draws a cyan line from (363, 145) to (433, 40).
; PLAN: r0=363(x1), r1=145(y1), r2=433(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 145
LDI r2, 433
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
