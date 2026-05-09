; DESCRIPTION: Renders a white box of size 31x34 starting at (277, 206).
; PLAN: r0=277(x), r1=206(y), r2=31(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 206
LDI r2, 31
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
