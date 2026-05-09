; DESCRIPTION: Renders a yellow line between points (405, 143) and (50, 186).
; PLAN: r0=405(x1), r1=143(y1), r2=50(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 143
LDI r2, 50
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
