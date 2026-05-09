; DESCRIPTION: Places a black 58x33 rectangle at position (318, 213).
; PLAN: r0=318(x), r1=213(y), r2=58(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 213
LDI r2, 58
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
