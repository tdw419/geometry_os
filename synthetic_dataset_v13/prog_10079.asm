; DESCRIPTION: Renders a cyan line between points (303, 138) and (285, 151).
; PLAN: r0=303(x1), r1=138(y1), r2=285(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 138
LDI r2, 285
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
