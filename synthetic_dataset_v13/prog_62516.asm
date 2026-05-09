; DESCRIPTION: Draws a white line from (443, 7) to (491, 224).
; PLAN: r0=443(x1), r1=7(y1), r2=491(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 7
LDI r2, 491
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
