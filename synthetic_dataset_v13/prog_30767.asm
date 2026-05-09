; DESCRIPTION: Renders a cyan box of size 69x26 starting at (384, 112).
; PLAN: r0=384(x), r1=112(y), r2=69(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 112
LDI r2, 69
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
