; DESCRIPTION: Renders a green line between points (284, 103) and (295, 98).
; PLAN: r0=284(x1), r1=103(y1), r2=295(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 103
LDI r2, 295
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
