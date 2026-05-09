; DESCRIPTION: Places a black 78x62 rectangle at position (213, 86).
; PLAN: r0=213(x), r1=86(y), r2=78(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 86
LDI r2, 78
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
