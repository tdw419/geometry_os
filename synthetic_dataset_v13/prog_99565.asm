; DESCRIPTION: Renders a cyan line between points (421, 51) and (460, 17).
; PLAN: r0=421(x1), r1=51(y1), r2=460(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 51
LDI r2, 460
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
