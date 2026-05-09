; DESCRIPTION: Renders a green line between points (340, 67) and (508, 28).
; PLAN: r0=340(x1), r1=67(y1), r2=508(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 67
LDI r2, 508
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
