; DESCRIPTION: Renders a magenta line between points (430, 59) and (284, 1).
; PLAN: r0=430(x1), r1=59(y1), r2=284(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 59
LDI r2, 284
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
