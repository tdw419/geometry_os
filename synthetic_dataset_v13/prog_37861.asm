; DESCRIPTION: Draws a white line from (382, 111) to (254, 103).
; PLAN: r0=382(x1), r1=111(y1), r2=254(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 111
LDI r2, 254
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
