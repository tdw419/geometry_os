; DESCRIPTION: Places a magenta line segment connecting (420, 221) to (460, 240).
; PLAN: r0=420(x1), r1=221(y1), r2=460(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 221
LDI r2, 460
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
