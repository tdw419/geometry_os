; DESCRIPTION: Renders a black box of size 66x42 starting at (197, 20).
; PLAN: r0=197(x), r1=20(y), r2=66(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 20
LDI r2, 66
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
