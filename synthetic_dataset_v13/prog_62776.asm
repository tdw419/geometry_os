; DESCRIPTION: Renders a cyan line between points (368, 149) and (220, 17).
; PLAN: r0=368(x1), r1=149(y1), r2=220(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 149
LDI r2, 220
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
