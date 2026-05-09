; DESCRIPTION: Renders a green line between points (57, 47) and (424, 164).
; PLAN: r0=57(x1), r1=47(y1), r2=424(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 47
LDI r2, 424
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
