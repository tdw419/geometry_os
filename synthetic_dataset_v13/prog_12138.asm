; DESCRIPTION: Places a purple line segment connecting (465, 228) to (460, 173).
; PLAN: r0=465(x1), r1=228(y1), r2=460(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 228
LDI r2, 460
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
