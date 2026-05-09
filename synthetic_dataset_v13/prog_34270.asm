; DESCRIPTION: Renders a cyan box of size 72x19 starting at (141, 149).
; PLAN: r0=141(x), r1=149(y), r2=72(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 149
LDI r2, 72
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
