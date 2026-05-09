; DESCRIPTION: Renders a yellow line between points (344, 82) and (397, 67).
; PLAN: r0=344(x1), r1=82(y1), r2=397(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 82
LDI r2, 397
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
