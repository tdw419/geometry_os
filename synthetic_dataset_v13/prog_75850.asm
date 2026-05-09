; DESCRIPTION: Renders a yellow box of size 75x35 starting at (213, 68).
; PLAN: r0=213(x), r1=68(y), r2=75(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 68
LDI r2, 75
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
