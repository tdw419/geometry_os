; DESCRIPTION: Places a cyan line segment connecting (313, 166) to (162, 107).
; PLAN: r0=313(x1), r1=166(y1), r2=162(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 166
LDI r2, 162
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
