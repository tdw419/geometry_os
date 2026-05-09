; DESCRIPTION: Places a red line segment connecting (460, 173) to (256, 72).
; PLAN: r0=460(x1), r1=173(y1), r2=256(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 173
LDI r2, 256
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
