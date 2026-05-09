; DESCRIPTION: Places a black 59x17 rectangle at position (301, 108).
; PLAN: r0=301(x), r1=108(y), r2=59(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 108
LDI r2, 59
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
