; DESCRIPTION: Places a cyan 120x105 rectangle at position (100, 43).
; PLAN: r0=100(x), r1=43(y), r2=120(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 43
LDI r2, 120
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
