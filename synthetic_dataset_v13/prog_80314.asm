; DESCRIPTION: Renders a cyan line between points (270, 81) and (499, 187).
; PLAN: r0=270(x1), r1=81(y1), r2=499(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 81
LDI r2, 499
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
