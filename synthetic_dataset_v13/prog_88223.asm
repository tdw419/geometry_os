; DESCRIPTION: Renders a red box of size 87x61 starting at (277, 110).
; PLAN: r0=277(x), r1=110(y), r2=87(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 110
LDI r2, 87
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
