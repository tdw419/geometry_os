; DESCRIPTION: Draws a black line from (28, 163) to (401, 202).
; PLAN: r0=28(x1), r1=163(y1), r2=401(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 163
LDI r2, 401
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
