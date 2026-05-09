; DESCRIPTION: Draws a yellow line from (131, 191) to (340, 228).
; PLAN: r0=131(x1), r1=191(y1), r2=340(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 191
LDI r2, 340
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
