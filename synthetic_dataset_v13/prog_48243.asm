; DESCRIPTION: Renders a cyan line between points (236, 204) and (115, 177).
; PLAN: r0=236(x1), r1=204(y1), r2=115(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 204
LDI r2, 115
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
