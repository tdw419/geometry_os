; DESCRIPTION: Places a magenta line segment connecting (27, 146) to (322, 138).
; PLAN: r0=27(x1), r1=146(y1), r2=322(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 146
LDI r2, 322
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
