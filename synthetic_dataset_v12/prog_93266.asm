; DESCRIPTION: Renders a cyan line between points (279, 96) and (494, 189).
; PLAN: r0=279(x1), r1=96(y1), r2=494(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 96
LDI r2, 494
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
