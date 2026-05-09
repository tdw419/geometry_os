; DESCRIPTION: Places a cyan line segment connecting (51, 32) to (150, 81).
; PLAN: r0=51(x1), r1=32(y1), r2=150(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 32
LDI r2, 150
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
