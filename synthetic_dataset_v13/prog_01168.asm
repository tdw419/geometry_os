; DESCRIPTION: Places a black 39x98 rectangle at position (450, 129).
; PLAN: r0=450(x), r1=129(y), r2=39(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 129
LDI r2, 39
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
