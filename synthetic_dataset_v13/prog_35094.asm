; DESCRIPTION: Renders a cyan box of size 113x81 starting at (129, 101).
; PLAN: r0=129(x), r1=101(y), r2=113(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 101
LDI r2, 113
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
