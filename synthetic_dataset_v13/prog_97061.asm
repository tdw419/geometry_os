; DESCRIPTION: Draws a white line from (384, 70) to (337, 192).
; PLAN: r0=384(x1), r1=70(y1), r2=337(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 70
LDI r2, 337
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
