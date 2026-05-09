; DESCRIPTION: Places a cyan 66x18 rectangle at position (122, 235).
; PLAN: r0=122(x), r1=235(y), r2=66(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 235
LDI r2, 66
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
