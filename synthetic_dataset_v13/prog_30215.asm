; DESCRIPTION: Draws a white line from (394, 69) to (196, 103).
; PLAN: r0=394(x1), r1=69(y1), r2=196(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 69
LDI r2, 196
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
