; DESCRIPTION: Places a black 50x100 rectangle at position (281, 43).
; PLAN: r0=281(x), r1=43(y), r2=50(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 43
LDI r2, 50
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
