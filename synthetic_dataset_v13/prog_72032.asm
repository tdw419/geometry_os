; DESCRIPTION: Places a red line segment connecting (197, 28) to (20, 166).
; PLAN: r0=197(x1), r1=28(y1), r2=20(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 28
LDI r2, 20
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
