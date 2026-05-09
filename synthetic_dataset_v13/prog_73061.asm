; DESCRIPTION: Draws a cyan line from (36, 88) to (443, 234).
; PLAN: r0=36(x1), r1=88(y1), r2=443(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 88
LDI r2, 443
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
