; DESCRIPTION: Renders a cyan line between points (332, 148) and (164, 202).
; PLAN: r0=332(x1), r1=148(y1), r2=164(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 148
LDI r2, 164
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
