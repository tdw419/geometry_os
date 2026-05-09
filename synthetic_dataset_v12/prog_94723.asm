; DESCRIPTION: Draws a black line from (38, 27) to (115, 60).
; PLAN: r0=38(x1), r1=27(y1), r2=115(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 27
LDI r2, 115
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
