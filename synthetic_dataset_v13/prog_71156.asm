; DESCRIPTION: Draws a black line from (209, 53) to (290, 141).
; PLAN: r0=209(x1), r1=53(y1), r2=290(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 53
LDI r2, 290
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
