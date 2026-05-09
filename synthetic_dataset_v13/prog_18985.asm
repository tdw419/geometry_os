; DESCRIPTION: Renders a green line between points (498, 107) and (371, 19).
; PLAN: r0=498(x1), r1=107(y1), r2=371(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 107
LDI r2, 371
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
