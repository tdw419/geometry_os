; DESCRIPTION: Draws a yellow line from (358, 196) to (374, 228).
; PLAN: r0=358(x1), r1=196(y1), r2=374(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 196
LDI r2, 374
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
