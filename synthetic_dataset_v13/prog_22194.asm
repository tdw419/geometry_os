; DESCRIPTION: Renders a cyan line between points (151, 184) and (398, 250).
; PLAN: r0=151(x1), r1=184(y1), r2=398(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 184
LDI r2, 398
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
