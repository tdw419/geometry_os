; DESCRIPTION: Places a black line segment connecting (410, 146) to (486, 135).
; PLAN: r0=410(x1), r1=146(y1), r2=486(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 146
LDI r2, 486
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
