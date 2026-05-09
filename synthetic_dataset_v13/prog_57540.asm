; DESCRIPTION: Places a yellow 39x39 rectangle at position (170, 92).
; PLAN: r0=170(x), r1=92(y), r2=39(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 92
LDI r2, 39
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
