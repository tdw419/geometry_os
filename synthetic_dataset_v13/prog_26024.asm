; DESCRIPTION: Renders a cyan line between points (9, 221) and (321, 65).
; PLAN: r0=9(x1), r1=221(y1), r2=321(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 221
LDI r2, 321
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
