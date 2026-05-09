; DESCRIPTION: Renders a red box of size 89x81 starting at (400, 152).
; PLAN: r0=400(x), r1=152(y), r2=89(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 152
LDI r2, 89
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
