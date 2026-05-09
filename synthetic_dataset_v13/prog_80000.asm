; DESCRIPTION: Renders a cyan line between points (208, 207) and (203, 202).
; PLAN: r0=208(x1), r1=207(y1), r2=203(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 207
LDI r2, 203
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
