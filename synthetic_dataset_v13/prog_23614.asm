; DESCRIPTION: Places a black 98x50 rectangle at position (173, 98).
; PLAN: r0=173(x), r1=98(y), r2=98(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 98
LDI r2, 98
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
