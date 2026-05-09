; DESCRIPTION: Renders a white line between points (393, 8) and (57, 190).
; PLAN: r0=393(x1), r1=8(y1), r2=57(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 8
LDI r2, 57
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
