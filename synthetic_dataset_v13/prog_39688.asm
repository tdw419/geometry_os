; DESCRIPTION: Renders a cyan line between points (408, 21) and (82, 133).
; PLAN: r0=408(x1), r1=21(y1), r2=82(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 21
LDI r2, 82
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
