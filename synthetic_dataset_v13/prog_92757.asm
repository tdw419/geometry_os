; DESCRIPTION: Draws a orange line from (152, 146) to (322, 182).
; PLAN: r0=152(x1), r1=146(y1), r2=322(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 146
LDI r2, 322
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
