; DESCRIPTION: Draws a red line from (152, 50) to (425, 43).
; PLAN: r0=152(x1), r1=50(y1), r2=425(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 50
LDI r2, 425
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
