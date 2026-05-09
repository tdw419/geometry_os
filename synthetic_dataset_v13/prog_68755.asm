; DESCRIPTION: Renders a cyan line between points (411, 236) and (421, 229).
; PLAN: r0=411(x1), r1=236(y1), r2=421(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 236
LDI r2, 421
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
