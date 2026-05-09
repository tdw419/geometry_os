; DESCRIPTION: Draws a cyan line from (393, 109) to (365, 230).
; PLAN: r0=393(x1), r1=109(y1), r2=365(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 109
LDI r2, 365
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
