; DESCRIPTION: Places a blue 39x53 rectangle at position (111, 34).
; PLAN: r0=111(x), r1=34(y), r2=39(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 34
LDI r2, 39
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
