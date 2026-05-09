; DESCRIPTION: Renders a cyan box of size 45x117 starting at (56, 133).
; PLAN: r0=56(x), r1=133(y), r2=45(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 133
LDI r2, 45
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
