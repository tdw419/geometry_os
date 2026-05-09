; DESCRIPTION: Draws a red line from (446, 173) to (321, 37).
; PLAN: r0=446(x1), r1=173(y1), r2=321(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 173
LDI r2, 321
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
