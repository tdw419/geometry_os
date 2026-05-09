; DESCRIPTION: Draws a green line from (32, 18) to (463, 213).
; PLAN: r0=32(x1), r1=18(y1), r2=463(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 18
LDI r2, 463
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
