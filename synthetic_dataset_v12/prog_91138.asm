; DESCRIPTION: Places a black 99x39 rectangle at position (303, 21).
; PLAN: r0=303(x), r1=21(y), r2=99(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 21
LDI r2, 99
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
