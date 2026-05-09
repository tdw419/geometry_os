; DESCRIPTION: Renders a cyan line between points (387, 209) and (89, 24).
; PLAN: r0=387(x1), r1=209(y1), r2=89(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 209
LDI r2, 89
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
