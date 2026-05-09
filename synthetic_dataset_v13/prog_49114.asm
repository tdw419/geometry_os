; DESCRIPTION: Renders a cyan line between points (359, 60) and (460, 32).
; PLAN: r0=359(x1), r1=60(y1), r2=460(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 60
LDI r2, 460
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
