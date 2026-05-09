; DESCRIPTION: Draws a green line from (434, 142) to (380, 141).
; PLAN: r0=434(x1), r1=142(y1), r2=380(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 142
LDI r2, 380
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
