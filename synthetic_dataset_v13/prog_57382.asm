; DESCRIPTION: Places a black 13x44 rectangle at position (180, 36).
; PLAN: r0=180(x), r1=36(y), r2=13(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 36
LDI r2, 13
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
