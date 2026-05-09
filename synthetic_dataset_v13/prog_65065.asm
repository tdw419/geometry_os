; DESCRIPTION: Renders a yellow box of size 64x120 starting at (50, 71).
; PLAN: r0=50(x), r1=71(y), r2=64(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 71
LDI r2, 64
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
