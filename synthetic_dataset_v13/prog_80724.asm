; DESCRIPTION: Places a cyan line segment connecting (174, 168) to (246, 102).
; PLAN: r0=174(x1), r1=168(y1), r2=246(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 168
LDI r2, 246
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
