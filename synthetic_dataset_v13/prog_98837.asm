; DESCRIPTION: Draws a cyan line from (54, 140) to (196, 96).
; PLAN: r0=54(x1), r1=140(y1), r2=196(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 140
LDI r2, 196
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
