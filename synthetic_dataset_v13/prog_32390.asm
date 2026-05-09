; DESCRIPTION: Renders a cyan line between points (2, 33) and (143, 12).
; PLAN: r0=2(x1), r1=33(y1), r2=143(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 33
LDI r2, 143
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
