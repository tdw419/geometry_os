; DESCRIPTION: Renders a cyan line between points (361, 176) and (498, 134).
; PLAN: r0=361(x1), r1=176(y1), r2=498(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 176
LDI r2, 498
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
