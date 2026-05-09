; DESCRIPTION: Renders a black line between points (438, 197) and (460, 206).
; PLAN: r0=438(x1), r1=197(y1), r2=460(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 197
LDI r2, 460
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
