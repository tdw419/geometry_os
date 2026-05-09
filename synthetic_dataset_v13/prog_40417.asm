; DESCRIPTION: Draws a cyan line from (115, 109) to (130, 34).
; PLAN: r0=115(x1), r1=109(y1), r2=130(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 109
LDI r2, 130
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
