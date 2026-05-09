; DESCRIPTION: Renders a green line between points (103, 190) and (254, 164).
; PLAN: r0=103(x1), r1=190(y1), r2=254(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 190
LDI r2, 254
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
