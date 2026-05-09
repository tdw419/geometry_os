; DESCRIPTION: Renders a cyan box of size 53x43 starting at (33, 76).
; PLAN: r0=33(x), r1=76(y), r2=53(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 76
LDI r2, 53
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
