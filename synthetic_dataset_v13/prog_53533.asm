; DESCRIPTION: Renders a black box of size 82x16 starting at (327, 71).
; PLAN: r0=327(x), r1=71(y), r2=82(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 71
LDI r2, 82
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
