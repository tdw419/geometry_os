; DESCRIPTION: Renders a yellow box of size 85x33 starting at (126, 206).
; PLAN: r0=126(x), r1=206(y), r2=85(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 206
LDI r2, 85
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
