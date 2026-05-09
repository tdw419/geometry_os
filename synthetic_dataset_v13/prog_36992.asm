; DESCRIPTION: Renders a blue box of size 82x99 starting at (372, 42).
; PLAN: r0=372(x), r1=42(y), r2=82(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 42
LDI r2, 82
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
