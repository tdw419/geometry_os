; DESCRIPTION: Renders a cyan line between points (15, 117) and (146, 13).
; PLAN: r0=15(x1), r1=117(y1), r2=146(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 117
LDI r2, 146
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
