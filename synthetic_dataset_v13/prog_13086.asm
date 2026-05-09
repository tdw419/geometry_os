; DESCRIPTION: Draws a white line from (307, 25) to (234, 210).
; PLAN: r0=307(x1), r1=25(y1), r2=234(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 25
LDI r2, 234
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
