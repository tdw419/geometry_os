; DESCRIPTION: Renders a cyan line between points (53, 237) and (269, 196).
; PLAN: r0=53(x1), r1=237(y1), r2=269(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 237
LDI r2, 269
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
