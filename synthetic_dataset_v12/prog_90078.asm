; DESCRIPTION: Renders a purple line between points (174, 143) and (354, 113).
; PLAN: r0=174(x1), r1=143(y1), r2=354(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 143
LDI r2, 354
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
