; DESCRIPTION: Places a red 12x20 rectangle at position (429, 170).
; PLAN: r0=429(x), r1=170(y), r2=12(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 170
LDI r2, 12
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
