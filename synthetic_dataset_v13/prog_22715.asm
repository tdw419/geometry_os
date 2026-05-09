; DESCRIPTION: Renders a cyan line between points (151, 149) and (324, 152).
; PLAN: r0=151(x1), r1=149(y1), r2=324(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 149
LDI r2, 324
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
