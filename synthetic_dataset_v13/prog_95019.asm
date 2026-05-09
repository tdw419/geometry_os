; DESCRIPTION: Renders a cyan line between points (324, 90) and (217, 26).
; PLAN: r0=324(x1), r1=90(y1), r2=217(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 90
LDI r2, 217
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
