; DESCRIPTION: Places a cyan line segment connecting (166, 88) to (81, 125).
; PLAN: r0=166(x1), r1=88(y1), r2=81(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 88
LDI r2, 81
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
