; DESCRIPTION: Renders a cyan line between points (103, 56) and (146, 129).
; PLAN: r0=103(x1), r1=56(y1), r2=146(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 56
LDI r2, 146
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
