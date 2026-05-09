; DESCRIPTION: Renders a cyan line between points (347, 173) and (265, 119).
; PLAN: r0=347(x1), r1=173(y1), r2=265(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 173
LDI r2, 265
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
