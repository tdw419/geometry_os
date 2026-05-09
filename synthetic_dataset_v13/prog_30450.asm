; DESCRIPTION: Renders a cyan line between points (71, 21) and (50, 208).
; PLAN: r0=71(x1), r1=21(y1), r2=50(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 21
LDI r2, 50
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
