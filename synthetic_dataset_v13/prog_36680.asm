; DESCRIPTION: Places a yellow 108x91 rectangle at position (262, 163).
; PLAN: r0=262(x), r1=163(y), r2=108(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 163
LDI r2, 108
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
