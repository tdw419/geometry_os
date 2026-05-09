; DESCRIPTION: Renders a green line between points (202, 253) and (340, 6).
; PLAN: r0=202(x1), r1=253(y1), r2=340(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 253
LDI r2, 340
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
