; DESCRIPTION: Places a black 12x39 rectangle at position (150, 213).
; PLAN: r0=150(x), r1=213(y), r2=12(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 213
LDI r2, 12
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
