; DESCRIPTION: Places a red 39x103 rectangle at position (414, 33).
; PLAN: r0=414(x), r1=33(y), r2=39(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 33
LDI r2, 39
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
