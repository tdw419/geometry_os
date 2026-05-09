; DESCRIPTION: Places a black 102x109 rectangle at position (107, 21).
; PLAN: r0=107(x), r1=21(y), r2=102(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 21
LDI r2, 102
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
