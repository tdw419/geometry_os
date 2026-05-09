; DESCRIPTION: Renders a black line between points (228, 1) and (82, 146).
; PLAN: r0=228(x1), r1=1(y1), r2=82(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 1
LDI r2, 82
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
