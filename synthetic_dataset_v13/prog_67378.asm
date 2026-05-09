; DESCRIPTION: Draws a green line from (57, 71) to (405, 29).
; PLAN: r0=57(x1), r1=71(y1), r2=405(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 71
LDI r2, 405
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
