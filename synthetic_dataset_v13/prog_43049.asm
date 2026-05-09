; DESCRIPTION: Renders a yellow box of size 70x87 starting at (61, 152).
; PLAN: r0=61(x), r1=152(y), r2=70(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 152
LDI r2, 70
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
