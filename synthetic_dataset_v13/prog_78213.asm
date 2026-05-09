; DESCRIPTION: Renders a cyan line between points (391, 237) and (377, 108).
; PLAN: r0=391(x1), r1=237(y1), r2=377(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 237
LDI r2, 377
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
