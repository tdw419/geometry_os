; DESCRIPTION: Renders a cyan line between points (133, 204) and (417, 215).
; PLAN: r0=133(x1), r1=204(y1), r2=417(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 204
LDI r2, 417
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
