; DESCRIPTION: Renders a green line between points (217, 230) and (284, 251).
; PLAN: r0=217(x1), r1=230(y1), r2=284(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 230
LDI r2, 284
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
