; DESCRIPTION: Renders a cyan line between points (20, 143) and (94, 239).
; PLAN: r0=20(x1), r1=143(y1), r2=94(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 143
LDI r2, 94
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
