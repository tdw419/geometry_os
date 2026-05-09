; DESCRIPTION: Renders a purple line between points (352, 108) and (228, 128).
; PLAN: r0=352(x1), r1=108(y1), r2=228(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 108
LDI r2, 228
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
