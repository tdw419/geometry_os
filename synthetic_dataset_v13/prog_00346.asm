; DESCRIPTION: Draws a black line from (340, 159) to (307, 187).
; PLAN: r0=340(x1), r1=159(y1), r2=307(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 159
LDI r2, 307
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
