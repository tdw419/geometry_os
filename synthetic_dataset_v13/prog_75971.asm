; DESCRIPTION: Draws a green line from (405, 36) to (384, 254).
; PLAN: r0=405(x1), r1=36(y1), r2=384(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 36
LDI r2, 384
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
