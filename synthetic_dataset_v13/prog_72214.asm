; DESCRIPTION: Renders a yellow line between points (502, 68) and (440, 240).
; PLAN: r0=502(x1), r1=68(y1), r2=440(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 68
LDI r2, 440
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
