; DESCRIPTION: Draws a black line from (445, 27) to (153, 244).
; PLAN: r0=445(x1), r1=27(y1), r2=153(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 27
LDI r2, 153
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
