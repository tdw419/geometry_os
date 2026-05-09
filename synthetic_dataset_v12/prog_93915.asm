; DESCRIPTION: Renders a cyan line between points (277, 99) and (354, 90).
; PLAN: r0=277(x1), r1=99(y1), r2=354(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 99
LDI r2, 354
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
