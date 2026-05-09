; DESCRIPTION: Renders a white line between points (284, 30) and (462, 198).
; PLAN: r0=284(x1), r1=30(y1), r2=462(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 30
LDI r2, 462
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
