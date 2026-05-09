; DESCRIPTION: Renders a cyan line between points (353, 10) and (167, 135).
; PLAN: r0=353(x1), r1=10(y1), r2=167(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 10
LDI r2, 167
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
