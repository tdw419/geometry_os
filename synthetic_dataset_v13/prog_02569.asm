; DESCRIPTION: Places a cyan line segment connecting (168, 116) to (251, 0).
; PLAN: r0=168(x1), r1=116(y1), r2=251(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 116
LDI r2, 251
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
