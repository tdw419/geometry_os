; DESCRIPTION: Renders a green line between points (174, 25) and (460, 151).
; PLAN: r0=174(x1), r1=25(y1), r2=460(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 25
LDI r2, 460
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
