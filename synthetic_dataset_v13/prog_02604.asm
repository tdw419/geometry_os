; DESCRIPTION: Renders a purple line between points (346, 70) and (69, 228).
; PLAN: r0=346(x1), r1=70(y1), r2=69(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 70
LDI r2, 69
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
