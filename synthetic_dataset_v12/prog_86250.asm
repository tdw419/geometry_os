; DESCRIPTION: Places a magenta 27x31 rectangle at position (391, 31).
; PLAN: r0=391(x), r1=31(y), r2=27(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 31
LDI r2, 27
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
