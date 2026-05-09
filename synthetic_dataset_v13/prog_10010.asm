; DESCRIPTION: Renders a green box of size 42x29 starting at (453, 19).
; PLAN: r0=453(x), r1=19(y), r2=42(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 19
LDI r2, 42
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
