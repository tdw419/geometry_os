; DESCRIPTION: Draws a red line from (492, 33) to (220, 210).
; PLAN: r0=492(x1), r1=33(y1), r2=220(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 33
LDI r2, 220
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
