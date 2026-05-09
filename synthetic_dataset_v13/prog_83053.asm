; DESCRIPTION: Renders a yellow line between points (284, 54) and (110, 86).
; PLAN: r0=284(x1), r1=54(y1), r2=110(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 54
LDI r2, 110
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
