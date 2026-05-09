; DESCRIPTION: Renders a cyan box of size 30x88 starting at (237, 149).
; PLAN: r0=237(x), r1=149(y), r2=30(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 149
LDI r2, 30
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
