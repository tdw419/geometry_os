; DESCRIPTION: Renders a cyan line between points (305, 43) and (70, 47).
; PLAN: r0=305(x1), r1=43(y1), r2=70(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 43
LDI r2, 70
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
