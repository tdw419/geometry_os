; DESCRIPTION: Renders a black line between points (352, 103) and (247, 236).
; PLAN: r0=352(x1), r1=103(y1), r2=247(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 103
LDI r2, 247
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
