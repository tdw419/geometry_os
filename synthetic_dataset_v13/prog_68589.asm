; DESCRIPTION: Draws a red line from (446, 38) to (303, 64).
; PLAN: r0=446(x1), r1=38(y1), r2=303(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 38
LDI r2, 303
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
