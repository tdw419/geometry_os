; DESCRIPTION: Renders a cyan line between points (45, 7) and (135, 46).
; PLAN: r0=45(x1), r1=7(y1), r2=135(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 7
LDI r2, 135
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
