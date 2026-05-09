; DESCRIPTION: Renders a yellow box of size 113x20 starting at (291, 61).
; PLAN: r0=291(x), r1=61(y), r2=113(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 61
LDI r2, 113
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
