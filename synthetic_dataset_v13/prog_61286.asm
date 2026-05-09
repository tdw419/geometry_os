; DESCRIPTION: Places a white 56x21 rectangle at position (235, 178).
; PLAN: r0=235(x), r1=178(y), r2=56(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 178
LDI r2, 56
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
