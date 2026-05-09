; DESCRIPTION: Renders a cyan line between points (511, 103) and (184, 161).
; PLAN: r0=511(x1), r1=103(y1), r2=184(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 103
LDI r2, 184
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
