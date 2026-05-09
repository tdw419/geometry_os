; DESCRIPTION: Draws a red line from (220, 240) to (166, 107).
; PLAN: r0=220(x1), r1=240(y1), r2=166(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 240
LDI r2, 166
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
