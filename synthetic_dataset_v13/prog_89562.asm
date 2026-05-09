; DESCRIPTION: Renders a cyan line between points (392, 157) and (465, 85).
; PLAN: r0=392(x1), r1=157(y1), r2=465(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 157
LDI r2, 465
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
