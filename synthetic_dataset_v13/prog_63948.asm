; DESCRIPTION: Renders a green box of size 45x48 starting at (262, 64).
; PLAN: r0=262(x), r1=64(y), r2=45(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 64
LDI r2, 45
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
