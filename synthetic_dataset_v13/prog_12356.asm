; DESCRIPTION: Renders a cyan box of size 39x85 starting at (53, 73).
; PLAN: r0=53(x), r1=73(y), r2=39(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 73
LDI r2, 39
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
