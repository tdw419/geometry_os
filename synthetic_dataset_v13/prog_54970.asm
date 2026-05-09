; DESCRIPTION: Renders a green line between points (284, 217) and (269, 172).
; PLAN: r0=284(x1), r1=217(y1), r2=269(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 217
LDI r2, 269
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
