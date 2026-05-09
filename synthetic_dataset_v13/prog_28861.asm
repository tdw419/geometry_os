; DESCRIPTION: Renders a blue box of size 57x120 starting at (239, 15).
; PLAN: r0=239(x), r1=15(y), r2=57(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 15
LDI r2, 57
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
