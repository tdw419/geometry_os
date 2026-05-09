; DESCRIPTION: Renders a cyan box of size 107x73 starting at (111, 69).
; PLAN: r0=111(x), r1=69(y), r2=107(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 69
LDI r2, 107
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
