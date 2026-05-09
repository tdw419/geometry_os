; DESCRIPTION: Draws a red line from (445, 61) to (371, 134).
; PLAN: r0=445(x1), r1=61(y1), r2=371(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 61
LDI r2, 371
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
