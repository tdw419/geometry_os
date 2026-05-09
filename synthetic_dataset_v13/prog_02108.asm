; DESCRIPTION: Renders a cyan line between points (324, 202) and (92, 238).
; PLAN: r0=324(x1), r1=202(y1), r2=92(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 202
LDI r2, 92
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
