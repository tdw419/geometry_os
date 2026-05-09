; DESCRIPTION: Draws a white line from (334, 86) to (196, 209).
; PLAN: r0=334(x1), r1=86(y1), r2=196(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 86
LDI r2, 196
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
