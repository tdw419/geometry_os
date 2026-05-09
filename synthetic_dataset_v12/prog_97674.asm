; DESCRIPTION: Places a purple 111x59 rectangle at position (354, 52).
; PLAN: r0=354(x), r1=52(y), r2=111(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 52
LDI r2, 111
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
