; DESCRIPTION: Renders a cyan line between points (81, 47) and (75, 174).
; PLAN: r0=81(x1), r1=47(y1), r2=75(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 47
LDI r2, 75
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
