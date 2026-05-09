; DESCRIPTION: Renders a cyan box of size 101x58 starting at (401, 58).
; PLAN: r0=401(x), r1=58(y), r2=101(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 58
LDI r2, 101
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
