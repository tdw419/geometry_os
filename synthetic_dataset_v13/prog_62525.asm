; DESCRIPTION: Renders a purple box of size 42x59 starting at (244, 113).
; PLAN: r0=244(x), r1=113(y), r2=42(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 113
LDI r2, 42
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
