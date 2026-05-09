; DESCRIPTION: Places a black line segment connecting (180, 163) to (380, 166).
; PLAN: r0=180(x1), r1=163(y1), r2=380(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 163
LDI r2, 380
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
