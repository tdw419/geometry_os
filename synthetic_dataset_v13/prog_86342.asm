; DESCRIPTION: Places a yellow 98x111 rectangle at position (20, 100).
; PLAN: r0=20(x), r1=100(y), r2=98(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 100
LDI r2, 98
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
