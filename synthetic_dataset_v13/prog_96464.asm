; DESCRIPTION: Renders a cyan line between points (431, 202) and (464, 135).
; PLAN: r0=431(x1), r1=202(y1), r2=464(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 202
LDI r2, 464
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
