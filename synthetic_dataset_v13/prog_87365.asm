; DESCRIPTION: Renders a black box of size 42x58 starting at (340, 195).
; PLAN: r0=340(x), r1=195(y), r2=42(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 195
LDI r2, 42
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
