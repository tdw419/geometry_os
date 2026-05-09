; DESCRIPTION: Draws a white line from (8, 239) to (191, 128).
; PLAN: r0=8(x1), r1=239(y1), r2=191(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 239
LDI r2, 191
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
