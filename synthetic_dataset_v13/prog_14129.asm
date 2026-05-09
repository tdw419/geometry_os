; DESCRIPTION: Renders a cyan line between points (350, 47) and (509, 10).
; PLAN: r0=350(x1), r1=47(y1), r2=509(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 47
LDI r2, 509
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
