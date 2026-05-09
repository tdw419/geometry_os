; DESCRIPTION: Renders a cyan line between points (286, 235) and (182, 28).
; PLAN: r0=286(x1), r1=235(y1), r2=182(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 235
LDI r2, 182
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
