; DESCRIPTION: Places a yellow 58x89 rectangle at position (391, 60).
; PLAN: r0=391(x), r1=60(y), r2=58(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 60
LDI r2, 58
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
