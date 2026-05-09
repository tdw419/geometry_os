; DESCRIPTION: Places a cyan line segment connecting (443, 236) to (125, 248).
; PLAN: r0=443(x1), r1=236(y1), r2=125(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 236
LDI r2, 125
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
