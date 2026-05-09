; DESCRIPTION: Draws a black line from (352, 109) to (228, 139).
; PLAN: r0=352(x1), r1=109(y1), r2=228(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 109
LDI r2, 228
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
