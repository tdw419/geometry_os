; DESCRIPTION: Renders a cyan line between points (208, 109) and (443, 57).
; PLAN: r0=208(x1), r1=109(y1), r2=443(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 109
LDI r2, 443
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
