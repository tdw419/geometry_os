; DESCRIPTION: Draws a cyan line from (170, 50) to (466, 138).
; PLAN: r0=170(x1), r1=50(y1), r2=466(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 50
LDI r2, 466
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
