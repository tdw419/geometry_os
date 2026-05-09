; DESCRIPTION: Renders a cyan box of size 17x87 starting at (472, 120).
; PLAN: r0=472(x), r1=120(y), r2=17(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 120
LDI r2, 17
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
