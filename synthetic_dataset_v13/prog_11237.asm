; DESCRIPTION: Renders a yellow box of size 46x70 starting at (115, 103).
; PLAN: r0=115(x), r1=103(y), r2=46(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 103
LDI r2, 46
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
