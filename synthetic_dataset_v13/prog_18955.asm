; DESCRIPTION: Renders a cyan line between points (3, 26) and (255, 75).
; PLAN: r0=3(x1), r1=26(y1), r2=255(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 26
LDI r2, 255
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
