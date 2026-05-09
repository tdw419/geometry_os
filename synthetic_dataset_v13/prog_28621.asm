; DESCRIPTION: Renders a black box of size 108x31 starting at (262, 113).
; PLAN: r0=262(x), r1=113(y), r2=108(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 113
LDI r2, 108
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
