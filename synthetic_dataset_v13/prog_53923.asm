; DESCRIPTION: Draws a white line from (399, 214) to (480, 224).
; PLAN: r0=399(x1), r1=214(y1), r2=480(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 214
LDI r2, 480
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
