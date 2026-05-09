; DESCRIPTION: Renders a cyan line between points (135, 176) and (181, 150).
; PLAN: r0=135(x1), r1=176(y1), r2=181(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 176
LDI r2, 181
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
