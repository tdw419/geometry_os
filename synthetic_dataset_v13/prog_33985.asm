; DESCRIPTION: Renders a cyan line between points (325, 206) and (70, 100).
; PLAN: r0=325(x1), r1=206(y1), r2=70(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 206
LDI r2, 70
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
