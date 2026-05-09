; DESCRIPTION: Places a cyan 69x82 rectangle at position (388, 132).
; PLAN: r0=388(x), r1=132(y), r2=69(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 132
LDI r2, 69
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
