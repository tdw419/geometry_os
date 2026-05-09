; DESCRIPTION: Draws a green line from (111, 71) to (127, 176).
; PLAN: r0=111(x1), r1=71(y1), r2=127(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 71
LDI r2, 127
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
