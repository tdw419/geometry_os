; DESCRIPTION: Places a yellow 84x111 rectangle at position (151, 106).
; PLAN: r0=151(x), r1=106(y), r2=84(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 106
LDI r2, 84
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
