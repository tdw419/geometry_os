; DESCRIPTION: Renders a black box of size 115x64 starting at (111, 152).
; PLAN: r0=111(x), r1=152(y), r2=115(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 152
LDI r2, 115
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
