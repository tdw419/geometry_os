; DESCRIPTION: Draws a green line from (146, 159) to (91, 55).
; PLAN: r0=146(x1), r1=159(y1), r2=91(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 159
LDI r2, 91
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
