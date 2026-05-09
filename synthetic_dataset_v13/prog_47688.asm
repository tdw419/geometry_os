; DESCRIPTION: Renders a cyan line between points (391, 90) and (355, 208).
; PLAN: r0=391(x1), r1=90(y1), r2=355(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 90
LDI r2, 355
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
