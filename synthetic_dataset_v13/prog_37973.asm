; DESCRIPTION: Draws a green line from (410, 14) to (491, 132).
; PLAN: r0=410(x1), r1=14(y1), r2=491(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 14
LDI r2, 491
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
