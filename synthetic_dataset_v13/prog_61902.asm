; DESCRIPTION: Places a black 15x42 rectangle at position (235, 8).
; PLAN: r0=235(x), r1=8(y), r2=15(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 8
LDI r2, 15
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
