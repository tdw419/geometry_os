; DESCRIPTION: Renders a cyan line between points (439, 146) and (277, 110).
; PLAN: r0=439(x1), r1=146(y1), r2=277(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 146
LDI r2, 277
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
