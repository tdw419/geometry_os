; DESCRIPTION: Renders a cyan box of size 79x22 starting at (219, 58).
; PLAN: r0=219(x), r1=58(y), r2=79(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 58
LDI r2, 79
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
