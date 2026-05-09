; DESCRIPTION: Places a magenta line segment connecting (168, 48) to (322, 214).
; PLAN: r0=168(x1), r1=48(y1), r2=322(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 48
LDI r2, 322
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
