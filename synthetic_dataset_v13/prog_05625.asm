; DESCRIPTION: Renders a blue box of size 55x112 starting at (146, 29).
; PLAN: r0=146(x), r1=29(y), r2=55(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 29
LDI r2, 55
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
