; DESCRIPTION: Places a magenta line segment connecting (298, 27) to (84, 146).
; PLAN: r0=298(x1), r1=27(y1), r2=84(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 27
LDI r2, 84
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
