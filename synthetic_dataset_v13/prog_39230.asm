; DESCRIPTION: Renders a yellow line between points (371, 42) and (290, 164).
; PLAN: r0=371(x1), r1=42(y1), r2=290(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 42
LDI r2, 290
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
