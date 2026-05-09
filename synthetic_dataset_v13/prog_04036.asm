; DESCRIPTION: Renders a cyan line between points (329, 23) and (84, 244).
; PLAN: r0=329(x1), r1=23(y1), r2=84(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 23
LDI r2, 84
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
