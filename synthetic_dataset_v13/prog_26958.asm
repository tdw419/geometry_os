; DESCRIPTION: Renders a yellow line between points (405, 39) and (434, 19).
; PLAN: r0=405(x1), r1=39(y1), r2=434(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 39
LDI r2, 434
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
