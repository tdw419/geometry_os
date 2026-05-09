; DESCRIPTION: Renders a cyan line between points (64, 135) and (201, 239).
; PLAN: r0=64(x1), r1=135(y1), r2=201(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 135
LDI r2, 201
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
