; DESCRIPTION: Places a cyan 71x90 rectangle at position (211, 115).
; PLAN: r0=211(x), r1=115(y), r2=71(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 115
LDI r2, 71
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
