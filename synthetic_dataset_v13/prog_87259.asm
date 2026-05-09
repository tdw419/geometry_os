; DESCRIPTION: Renders a cyan box of size 14x12 starting at (263, 121).
; PLAN: r0=263(x), r1=121(y), r2=14(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 121
LDI r2, 14
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
