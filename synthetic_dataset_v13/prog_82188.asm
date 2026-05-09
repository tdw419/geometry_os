; DESCRIPTION: Renders a blue box of size 57x108 starting at (146, 12).
; PLAN: r0=146(x), r1=12(y), r2=57(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 12
LDI r2, 57
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
