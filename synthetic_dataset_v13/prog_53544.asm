; DESCRIPTION: Draws a green line from (446, 38) to (122, 120).
; PLAN: r0=446(x1), r1=38(y1), r2=122(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 38
LDI r2, 122
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
