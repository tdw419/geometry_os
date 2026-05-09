; DESCRIPTION: Renders a cyan line between points (213, 105) and (262, 112).
; PLAN: r0=213(x1), r1=105(y1), r2=262(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 105
LDI r2, 262
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
