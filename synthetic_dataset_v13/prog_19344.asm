; DESCRIPTION: Places a cyan 58x78 rectangle at position (235, 47).
; PLAN: r0=235(x), r1=47(y), r2=58(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 47
LDI r2, 58
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
