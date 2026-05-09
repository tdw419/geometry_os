; DESCRIPTION: Renders a purple box of size 102x59 starting at (112, 42).
; PLAN: r0=112(x), r1=42(y), r2=102(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 42
LDI r2, 102
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
