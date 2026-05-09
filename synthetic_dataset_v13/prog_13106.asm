; DESCRIPTION: Renders a cyan line between points (29, 166) and (91, 179).
; PLAN: r0=29(x1), r1=166(y1), r2=91(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 166
LDI r2, 91
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
