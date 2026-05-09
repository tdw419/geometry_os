; DESCRIPTION: Draws a green line from (393, 117) to (113, 49).
; PLAN: r0=393(x1), r1=117(y1), r2=113(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 117
LDI r2, 113
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
