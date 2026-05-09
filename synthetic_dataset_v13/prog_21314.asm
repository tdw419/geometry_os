; DESCRIPTION: Renders a cyan line between points (440, 60) and (443, 156).
; PLAN: r0=440(x1), r1=60(y1), r2=443(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 60
LDI r2, 443
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
