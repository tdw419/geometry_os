; DESCRIPTION: Places a red line segment connecting (354, 213) to (289, 113).
; PLAN: r0=354(x1), r1=213(y1), r2=289(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 213
LDI r2, 289
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
