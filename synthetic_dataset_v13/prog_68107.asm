; DESCRIPTION: Renders a cyan line between points (179, 146) and (273, 29).
; PLAN: r0=179(x1), r1=146(y1), r2=273(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 146
LDI r2, 273
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
