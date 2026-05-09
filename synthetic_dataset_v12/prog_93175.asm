; DESCRIPTION: Places a cyan line segment connecting (391, 166) to (63, 43).
; PLAN: r0=391(x1), r1=166(y1), r2=63(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 166
LDI r2, 63
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
