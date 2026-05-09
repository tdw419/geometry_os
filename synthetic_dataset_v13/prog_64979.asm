; DESCRIPTION: Places a cyan line segment connecting (217, 145) to (168, 20).
; PLAN: r0=217(x1), r1=145(y1), r2=168(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 145
LDI r2, 168
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
