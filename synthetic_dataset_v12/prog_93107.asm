; DESCRIPTION: Renders a cyan box of size 30x68 starting at (141, 184).
; PLAN: r0=141(x), r1=184(y), r2=30(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 184
LDI r2, 30
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
