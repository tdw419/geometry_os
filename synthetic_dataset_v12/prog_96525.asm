; DESCRIPTION: Renders a cyan line between points (441, 196) and (481, 100).
; PLAN: r0=441(x1), r1=196(y1), r2=481(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 196
LDI r2, 481
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
