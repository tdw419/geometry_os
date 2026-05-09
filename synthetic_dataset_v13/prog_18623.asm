; DESCRIPTION: Places a red line segment connecting (102, 209) to (74, 213).
; PLAN: r0=102(x1), r1=209(y1), r2=74(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 209
LDI r2, 74
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
