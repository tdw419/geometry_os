; DESCRIPTION: Renders a black box of size 97x111 starting at (328, 132).
; PLAN: r0=328(x), r1=132(y), r2=97(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 132
LDI r2, 97
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
