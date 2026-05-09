; DESCRIPTION: Renders a black box of size 27x69 starting at (175, 37).
; PLAN: r0=175(x), r1=37(y), r2=27(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 37
LDI r2, 27
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
