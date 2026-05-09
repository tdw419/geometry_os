; DESCRIPTION: Renders a cyan line between points (321, 30) and (360, 174).
; PLAN: r0=321(x1), r1=30(y1), r2=360(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 30
LDI r2, 360
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
