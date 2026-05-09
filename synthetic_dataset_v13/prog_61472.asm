; DESCRIPTION: Places a black 111x44 rectangle at position (28, 182).
; PLAN: r0=28(x), r1=182(y), r2=111(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 182
LDI r2, 111
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
