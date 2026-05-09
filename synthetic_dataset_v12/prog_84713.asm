; DESCRIPTION: Renders a white line between points (65, 134) and (284, 207).
; PLAN: r0=65(x1), r1=134(y1), r2=284(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 134
LDI r2, 284
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
