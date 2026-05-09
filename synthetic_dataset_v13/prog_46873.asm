; DESCRIPTION: Places a yellow 75x111 rectangle at position (313, 13).
; PLAN: r0=313(x), r1=13(y), r2=75(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 13
LDI r2, 75
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
