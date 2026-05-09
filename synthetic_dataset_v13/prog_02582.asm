; DESCRIPTION: Renders a white line between points (284, 176) and (260, 148).
; PLAN: r0=284(x1), r1=176(y1), r2=260(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 176
LDI r2, 260
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
