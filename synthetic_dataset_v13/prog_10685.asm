; DESCRIPTION: Renders a cyan box of size 108x93 starting at (76, 100).
; PLAN: r0=76(x), r1=100(y), r2=108(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 100
LDI r2, 108
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
