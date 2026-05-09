; DESCRIPTION: Renders a white box of size 35x95 starting at (271, 152).
; PLAN: r0=271(x), r1=152(y), r2=35(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 152
LDI r2, 35
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
