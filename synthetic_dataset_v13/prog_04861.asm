; DESCRIPTION: Renders a cyan line between points (306, 202) and (294, 106).
; PLAN: r0=306(x1), r1=202(y1), r2=294(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 202
LDI r2, 294
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
