; DESCRIPTION: Draws a cyan line from (399, 93) to (130, 54).
; PLAN: r0=399(x1), r1=93(y1), r2=130(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 93
LDI r2, 130
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
