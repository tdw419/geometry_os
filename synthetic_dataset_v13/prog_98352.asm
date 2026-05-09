; DESCRIPTION: Places a cyan line segment connecting (164, 166) to (212, 71).
; PLAN: r0=164(x1), r1=166(y1), r2=212(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 166
LDI r2, 212
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
