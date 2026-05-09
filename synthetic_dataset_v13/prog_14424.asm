; DESCRIPTION: Places a yellow line segment connecting (442, 168) to (213, 177).
; PLAN: r0=442(x1), r1=168(y1), r2=213(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 168
LDI r2, 213
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
