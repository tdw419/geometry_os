; DESCRIPTION: Places a cyan line segment connecting (327, 166) to (225, 90).
; PLAN: r0=327(x1), r1=166(y1), r2=225(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 166
LDI r2, 225
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
