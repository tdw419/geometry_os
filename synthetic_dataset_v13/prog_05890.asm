; DESCRIPTION: Draws a cyan line from (50, 161) to (26, 144).
; PLAN: r0=50(x1), r1=161(y1), r2=26(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 161
LDI r2, 26
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
