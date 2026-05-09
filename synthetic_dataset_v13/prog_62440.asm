; DESCRIPTION: Renders a cyan box of size 87x17 starting at (213, 219).
; PLAN: r0=213(x), r1=219(y), r2=87(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 219
LDI r2, 87
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
