; DESCRIPTION: Renders a yellow box of size 15x103 starting at (54, 113).
; PLAN: r0=54(x), r1=113(y), r2=15(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 113
LDI r2, 15
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
