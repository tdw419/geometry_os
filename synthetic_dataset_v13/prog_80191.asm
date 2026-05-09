; DESCRIPTION: Draws a white line from (128, 223) to (480, 34).
; PLAN: r0=128(x1), r1=223(y1), r2=480(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 223
LDI r2, 480
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
