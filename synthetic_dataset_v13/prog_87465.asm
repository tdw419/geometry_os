; DESCRIPTION: Places a green line segment connecting (150, 228) to (194, 171).
; PLAN: r0=150(x1), r1=228(y1), r2=194(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 228
LDI r2, 194
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
