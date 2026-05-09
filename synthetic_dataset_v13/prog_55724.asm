; DESCRIPTION: Renders a cyan line between points (342, 205) and (22, 187).
; PLAN: r0=342(x1), r1=205(y1), r2=22(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 205
LDI r2, 22
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
