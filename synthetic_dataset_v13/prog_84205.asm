; DESCRIPTION: Renders a yellow box of size 70x44 starting at (416, 10).
; PLAN: r0=416(x), r1=10(y), r2=70(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 10
LDI r2, 70
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
