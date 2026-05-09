; DESCRIPTION: Places a black 27x40 rectangle at position (363, 108).
; PLAN: r0=363(x), r1=108(y), r2=27(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 108
LDI r2, 27
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
