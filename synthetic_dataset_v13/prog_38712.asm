; DESCRIPTION: Renders a yellow box of size 72x18 starting at (126, 195).
; PLAN: r0=126(x), r1=195(y), r2=72(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 195
LDI r2, 72
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
