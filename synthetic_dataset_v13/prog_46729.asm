; DESCRIPTION: Renders a cyan line between points (429, 220) and (455, 58).
; PLAN: r0=429(x1), r1=220(y1), r2=455(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 220
LDI r2, 455
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
