; DESCRIPTION: Places a orange 24x17 rectangle at position (246, 94).
; PLAN: r0=246(x), r1=94(y), r2=24(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 94
LDI r2, 24
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
