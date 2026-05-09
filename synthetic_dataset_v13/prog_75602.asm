; DESCRIPTION: Places a black 98x50 rectangle at position (373, 59).
; PLAN: r0=373(x), r1=59(y), r2=98(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 59
LDI r2, 98
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
