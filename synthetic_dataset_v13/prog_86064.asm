; DESCRIPTION: Renders a yellow line between points (460, 126) and (263, 69).
; PLAN: r0=460(x1), r1=126(y1), r2=263(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 126
LDI r2, 263
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
