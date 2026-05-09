; DESCRIPTION: Places a cyan line segment connecting (95, 132) to (103, 120).
; PLAN: r0=95(x1), r1=132(y1), r2=103(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 132
LDI r2, 103
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
