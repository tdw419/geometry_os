; DESCRIPTION: Draws a cyan line from (160, 183) to (81, 196).
; PLAN: r0=160(x1), r1=183(y1), r2=81(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 183
LDI r2, 81
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
