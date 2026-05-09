; DESCRIPTION: Renders a cyan line between points (187, 158) and (45, 195).
; PLAN: r0=187(x1), r1=158(y1), r2=45(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 158
LDI r2, 45
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
