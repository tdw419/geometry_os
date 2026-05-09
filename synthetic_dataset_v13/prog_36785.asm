; DESCRIPTION: Renders a green line between points (202, 28) and (330, 63).
; PLAN: r0=202(x1), r1=28(y1), r2=330(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 28
LDI r2, 330
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
