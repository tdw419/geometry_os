; DESCRIPTION: Renders a yellow line between points (405, 12) and (420, 213).
; PLAN: r0=405(x1), r1=12(y1), r2=420(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 12
LDI r2, 420
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
