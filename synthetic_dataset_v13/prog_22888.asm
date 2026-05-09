; DESCRIPTION: Draws a yellow line from (48, 108) to (339, 228).
; PLAN: r0=48(x1), r1=108(y1), r2=339(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 108
LDI r2, 339
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
