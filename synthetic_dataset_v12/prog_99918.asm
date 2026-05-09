; DESCRIPTION: Renders a yellow box of size 61x102 starting at (416, 152).
; PLAN: r0=416(x), r1=152(y), r2=61(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 152
LDI r2, 61
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
