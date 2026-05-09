; DESCRIPTION: Renders a green line between points (284, 12) and (86, 231).
; PLAN: r0=284(x1), r1=12(y1), r2=86(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 12
LDI r2, 86
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
