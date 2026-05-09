; DESCRIPTION: Renders a cyan line between points (488, 56) and (81, 57).
; PLAN: r0=488(x1), r1=56(y1), r2=81(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 56
LDI r2, 81
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
