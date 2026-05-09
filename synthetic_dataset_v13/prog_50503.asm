; DESCRIPTION: Renders a cyan line between points (336, 167) and (498, 127).
; PLAN: r0=336(x1), r1=167(y1), r2=498(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 167
LDI r2, 498
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
