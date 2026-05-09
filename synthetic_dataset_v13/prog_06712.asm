; DESCRIPTION: Renders a cyan line between points (324, 135) and (244, 128).
; PLAN: r0=324(x1), r1=135(y1), r2=244(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 135
LDI r2, 244
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
