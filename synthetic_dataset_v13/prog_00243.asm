; DESCRIPTION: Renders a yellow line between points (284, 91) and (32, 180).
; PLAN: r0=284(x1), r1=91(y1), r2=32(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 91
LDI r2, 32
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
