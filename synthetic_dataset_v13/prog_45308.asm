; DESCRIPTION: Renders a black box of size 53x16 starting at (450, 126).
; PLAN: r0=450(x), r1=126(y), r2=53(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 126
LDI r2, 53
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
