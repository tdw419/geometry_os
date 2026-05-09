; DESCRIPTION: Draws a white line from (320, 58) to (27, 61).
; PLAN: r0=320(x1), r1=58(y1), r2=27(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 58
LDI r2, 27
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
