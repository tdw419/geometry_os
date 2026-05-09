; DESCRIPTION: Draws a green line from (43, 208) to (48, 134).
; PLAN: r0=43(x1), r1=208(y1), r2=48(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 208
LDI r2, 48
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
