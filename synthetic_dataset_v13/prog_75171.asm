; DESCRIPTION: Renders a black box of size 106x64 starting at (106, 183).
; PLAN: r0=106(x), r1=183(y), r2=106(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 183
LDI r2, 106
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
