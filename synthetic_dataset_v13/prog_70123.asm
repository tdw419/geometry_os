; DESCRIPTION: Renders a cyan line between points (246, 167) and (410, 161).
; PLAN: r0=246(x1), r1=167(y1), r2=410(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 167
LDI r2, 410
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
