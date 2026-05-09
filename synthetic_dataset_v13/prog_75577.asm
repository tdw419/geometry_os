; DESCRIPTION: Places a red line segment connecting (410, 213) to (473, 156).
; PLAN: r0=410(x1), r1=213(y1), r2=473(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 213
LDI r2, 473
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
