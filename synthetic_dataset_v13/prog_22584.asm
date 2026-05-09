; DESCRIPTION: Places a white line segment connecting (434, 41) to (196, 144).
; PLAN: r0=434(x1), r1=41(y1), r2=196(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 41
LDI r2, 196
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
