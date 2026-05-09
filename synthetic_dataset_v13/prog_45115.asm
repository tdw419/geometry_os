; DESCRIPTION: Renders a orange line between points (20, 242) and (446, 236).
; PLAN: r0=20(x1), r1=242(y1), r2=446(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 242
LDI r2, 446
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
