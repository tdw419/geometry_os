; DESCRIPTION: Draws a red line from (214, 149) to (356, 107).
; PLAN: r0=214(x1), r1=149(y1), r2=356(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 149
LDI r2, 356
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
