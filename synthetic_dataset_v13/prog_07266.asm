; DESCRIPTION: Places a orange 58x12 rectangle at position (228, 240).
; PLAN: r0=228(x), r1=240(y), r2=58(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 240
LDI r2, 58
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
