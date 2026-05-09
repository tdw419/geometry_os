; DESCRIPTION: Places a red line segment connecting (313, 202) to (166, 236).
; PLAN: r0=313(x1), r1=202(y1), r2=166(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 202
LDI r2, 166
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
