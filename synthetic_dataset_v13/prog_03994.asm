; DESCRIPTION: Places a black line segment connecting (410, 48) to (228, 90).
; PLAN: r0=410(x1), r1=48(y1), r2=228(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 48
LDI r2, 228
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
