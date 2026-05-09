; DESCRIPTION: Renders a cyan line between points (113, 4) and (27, 133).
; PLAN: r0=113(x1), r1=4(y1), r2=27(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 4
LDI r2, 27
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
