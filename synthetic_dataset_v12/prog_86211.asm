; DESCRIPTION: Places a green 78x85 rectangle at position (235, 143).
; PLAN: r0=235(x), r1=143(y), r2=78(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 143
LDI r2, 78
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
