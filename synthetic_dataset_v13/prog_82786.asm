; DESCRIPTION: Places a cyan line segment connecting (411, 246) to (403, 247).
; PLAN: r0=411(x1), r1=246(y1), r2=403(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 246
LDI r2, 403
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
