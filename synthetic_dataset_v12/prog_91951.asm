; DESCRIPTION: Renders a cyan line between points (484, 150) and (460, 30).
; PLAN: r0=484(x1), r1=150(y1), r2=460(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 150
LDI r2, 460
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
