; DESCRIPTION: Places a cyan line segment connecting (125, 47) to (159, 43).
; PLAN: r0=125(x1), r1=47(y1), r2=159(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 47
LDI r2, 159
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
