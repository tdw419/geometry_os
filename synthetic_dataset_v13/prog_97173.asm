; DESCRIPTION: Renders a cyan line between points (160, 189) and (447, 28).
; PLAN: r0=160(x1), r1=189(y1), r2=447(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 189
LDI r2, 447
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
