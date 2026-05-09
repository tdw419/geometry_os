; DESCRIPTION: Draws a black line from (326, 126) to (460, 68).
; PLAN: r0=326(x1), r1=126(y1), r2=460(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 126
LDI r2, 460
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
