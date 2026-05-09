; DESCRIPTION: Renders a cyan box of size 17x98 starting at (56, 58).
; PLAN: r0=56(x), r1=58(y), r2=17(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 58
LDI r2, 17
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
