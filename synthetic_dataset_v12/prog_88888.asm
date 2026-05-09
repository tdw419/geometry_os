; DESCRIPTION: Renders a black box of size 54x83 starting at (126, 50).
; PLAN: r0=126(x), r1=50(y), r2=54(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 50
LDI r2, 54
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
