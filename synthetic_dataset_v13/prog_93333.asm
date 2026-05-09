; DESCRIPTION: Renders a cyan line between points (35, 205) and (443, 236).
; PLAN: r0=35(x1), r1=205(y1), r2=443(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 205
LDI r2, 443
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
