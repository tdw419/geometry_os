; DESCRIPTION: Renders a yellow box of size 70x20 starting at (206, 165).
; PLAN: r0=206(x), r1=165(y), r2=70(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 165
LDI r2, 70
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
