; DESCRIPTION: Renders a red line between points (64, 210) and (330, 132).
; PLAN: r0=64(x1), r1=210(y1), r2=330(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 210
LDI r2, 330
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
