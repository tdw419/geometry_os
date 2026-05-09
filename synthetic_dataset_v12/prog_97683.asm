; DESCRIPTION: Renders a cyan line between points (491, 200) and (433, 55).
; PLAN: r0=491(x1), r1=200(y1), r2=433(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 200
LDI r2, 433
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
