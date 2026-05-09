; DESCRIPTION: Renders a green line between points (439, 164) and (349, 187).
; PLAN: r0=439(x1), r1=164(y1), r2=349(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 164
LDI r2, 349
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
