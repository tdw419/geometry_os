; DESCRIPTION: Renders a black box of size 52x42 starting at (286, 66).
; PLAN: r0=286(x), r1=66(y), r2=52(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 66
LDI r2, 52
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
