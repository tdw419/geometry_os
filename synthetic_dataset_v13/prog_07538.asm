; DESCRIPTION: Renders a green line between points (320, 168) and (408, 198).
; PLAN: r0=320(x1), r1=168(y1), r2=408(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 168
LDI r2, 408
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
