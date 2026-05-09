; DESCRIPTION: Draws a cyan line from (430, 30) to (107, 234).
; PLAN: r0=430(x1), r1=30(y1), r2=107(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 30
LDI r2, 107
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
