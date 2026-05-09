; DESCRIPTION: Places a cyan line segment connecting (75, 166) to (0, 187).
; PLAN: r0=75(x1), r1=166(y1), r2=0(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 166
LDI r2, 0
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
