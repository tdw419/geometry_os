; DESCRIPTION: Draws a black line from (117, 40) to (394, 187).
; PLAN: r0=117(x1), r1=40(y1), r2=394(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 40
LDI r2, 394
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
