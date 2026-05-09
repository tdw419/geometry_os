; DESCRIPTION: Places a white 60x24 rectangle at position (235, 34).
; PLAN: r0=235(x), r1=34(y), r2=60(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 34
LDI r2, 60
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
