; DESCRIPTION: Renders a cyan line between points (426, 51) and (320, 240).
; PLAN: r0=426(x1), r1=51(y1), r2=320(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 51
LDI r2, 320
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
