; DESCRIPTION: Places a cyan line segment connecting (443, 142) to (66, 126).
; PLAN: r0=443(x1), r1=142(y1), r2=66(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 142
LDI r2, 66
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
