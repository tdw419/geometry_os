; DESCRIPTION: Draws a cyan line from (126, 102) to (170, 227).
; PLAN: r0=126(x1), r1=102(y1), r2=170(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 102
LDI r2, 170
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
