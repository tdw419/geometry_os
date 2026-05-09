; DESCRIPTION: Places a cyan 69x63 rectangle at position (108, 120).
; PLAN: r0=108(x), r1=120(y), r2=69(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 120
LDI r2, 69
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
