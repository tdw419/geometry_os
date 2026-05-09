; DESCRIPTION: Places a red line segment connecting (420, 228) to (322, 208).
; PLAN: r0=420(x1), r1=228(y1), r2=322(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 228
LDI r2, 322
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
