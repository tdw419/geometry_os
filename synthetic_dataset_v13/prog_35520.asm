; DESCRIPTION: Renders a cyan box of size 102x10 starting at (133, 141).
; PLAN: r0=133(x), r1=141(y), r2=102(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 141
LDI r2, 102
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
