; DESCRIPTION: Renders a yellow box of size 87x14 starting at (228, 141).
; PLAN: r0=228(x), r1=141(y), r2=87(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 141
LDI r2, 87
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
