; DESCRIPTION: Draws a black line from (304, 173) to (372, 65).
; PLAN: r0=304(x1), r1=173(y1), r2=372(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 173
LDI r2, 372
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
