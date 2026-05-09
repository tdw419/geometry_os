; DESCRIPTION: Renders a cyan line between points (393, 33) and (297, 60).
; PLAN: r0=393(x1), r1=33(y1), r2=297(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 33
LDI r2, 297
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
