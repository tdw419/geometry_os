; DESCRIPTION: Renders a cyan box of size 94x88 starting at (278, 6).
; PLAN: r0=278(x), r1=6(y), r2=94(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 6
LDI r2, 94
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
