; DESCRIPTION: Renders a red line between points (438, 39) and (124, 213).
; PLAN: r0=438(x1), r1=39(y1), r2=124(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 39
LDI r2, 124
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
