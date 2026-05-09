; DESCRIPTION: Renders a green box of size 64x113 starting at (168, 112).
; PLAN: r0=168(x), r1=112(y), r2=64(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 112
LDI r2, 64
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
