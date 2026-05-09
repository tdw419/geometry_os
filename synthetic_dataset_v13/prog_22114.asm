; DESCRIPTION: Places a yellow 39x53 rectangle at position (334, 29).
; PLAN: r0=334(x), r1=29(y), r2=39(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 29
LDI r2, 39
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
