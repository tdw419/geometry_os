; DESCRIPTION: Places a green 30x113 rectangle at position (235, 101).
; PLAN: r0=235(x), r1=101(y), r2=30(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 101
LDI r2, 30
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
