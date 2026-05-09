; DESCRIPTION: Renders a cyan box of size 62x120 starting at (6, 69).
; PLAN: r0=6(x), r1=69(y), r2=62(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 69
LDI r2, 62
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
