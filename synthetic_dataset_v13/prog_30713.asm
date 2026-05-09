; DESCRIPTION: Draws a green line from (208, 112) to (211, 228).
; PLAN: r0=208(x1), r1=112(y1), r2=211(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 112
LDI r2, 211
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
