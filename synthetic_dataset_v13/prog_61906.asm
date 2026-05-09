; DESCRIPTION: Renders a white box of size 29x45 starting at (296, 126).
; PLAN: r0=296(x), r1=126(y), r2=29(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 126
LDI r2, 29
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
