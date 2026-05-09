; DESCRIPTION: Renders a yellow box of size 64x113 starting at (48, 37).
; PLAN: r0=48(x), r1=37(y), r2=64(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 37
LDI r2, 64
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
