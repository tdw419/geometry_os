; DESCRIPTION: Renders a yellow box of size 86x120 starting at (92, 128).
; PLAN: r0=92(x), r1=128(y), r2=86(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 128
LDI r2, 86
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
