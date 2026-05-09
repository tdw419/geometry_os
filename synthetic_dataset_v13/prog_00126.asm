; DESCRIPTION: Places a cyan line segment connecting (460, 203) to (395, 95).
; PLAN: r0=460(x1), r1=203(y1), r2=395(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 203
LDI r2, 395
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
