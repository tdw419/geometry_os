; DESCRIPTION: Renders a cyan box of size 46x88 starting at (396, 33).
; PLAN: r0=396(x), r1=33(y), r2=46(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 33
LDI r2, 46
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
