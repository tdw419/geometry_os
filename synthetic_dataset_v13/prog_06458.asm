; DESCRIPTION: Renders a cyan box of size 101x69 starting at (200, 29).
; PLAN: r0=200(x), r1=29(y), r2=101(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 29
LDI r2, 101
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
