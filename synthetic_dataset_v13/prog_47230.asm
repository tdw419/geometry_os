; DESCRIPTION: Renders a yellow box of size 72x42 starting at (125, 25).
; PLAN: r0=125(x), r1=25(y), r2=72(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 25
LDI r2, 72
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
