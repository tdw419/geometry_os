; DESCRIPTION: Places a green line segment connecting (303, 228) to (19, 52).
; PLAN: r0=303(x1), r1=228(y1), r2=19(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 228
LDI r2, 19
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
