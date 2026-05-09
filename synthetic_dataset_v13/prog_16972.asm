; DESCRIPTION: Renders a yellow box of size 16x27 starting at (175, 67).
; PLAN: r0=175(x), r1=67(y), r2=16(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 67
LDI r2, 16
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
