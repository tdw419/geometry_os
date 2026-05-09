; DESCRIPTION: Draws a red line from (398, 50) to (135, 62).
; PLAN: r0=398(x1), r1=50(y1), r2=135(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 50
LDI r2, 135
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
