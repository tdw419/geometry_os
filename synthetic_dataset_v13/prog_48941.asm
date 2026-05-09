; DESCRIPTION: Places a white line segment connecting (394, 191) to (307, 228).
; PLAN: r0=394(x1), r1=191(y1), r2=307(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 191
LDI r2, 307
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
