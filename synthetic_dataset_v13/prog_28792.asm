; DESCRIPTION: Draws a black line from (289, 168) to (424, 146).
; PLAN: r0=289(x1), r1=168(y1), r2=424(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 168
LDI r2, 424
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
