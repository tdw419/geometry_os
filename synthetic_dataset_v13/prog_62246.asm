; DESCRIPTION: Renders a black box of size 111x103 starting at (113, 86).
; PLAN: r0=113(x), r1=86(y), r2=111(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 86
LDI r2, 111
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
