; DESCRIPTION: Places a cyan line segment connecting (60, 30) to (263, 174).
; PLAN: r0=60(x1), r1=30(y1), r2=263(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 30
LDI r2, 263
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
