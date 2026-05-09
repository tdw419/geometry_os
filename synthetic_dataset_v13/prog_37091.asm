; DESCRIPTION: Draws a cyan line from (443, 63) to (250, 70).
; PLAN: r0=443(x1), r1=63(y1), r2=250(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 63
LDI r2, 250
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
