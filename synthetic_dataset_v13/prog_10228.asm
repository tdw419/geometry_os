; DESCRIPTION: Draws a green line from (254, 204) to (1, 213).
; PLAN: r0=254(x1), r1=204(y1), r2=1(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 204
LDI r2, 1
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
