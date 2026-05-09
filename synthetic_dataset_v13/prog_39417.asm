; DESCRIPTION: Renders a cyan line between points (433, 26) and (210, 10).
; PLAN: r0=433(x1), r1=26(y1), r2=210(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 26
LDI r2, 210
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
