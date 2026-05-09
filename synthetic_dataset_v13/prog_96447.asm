; DESCRIPTION: Places a white 103x107 rectangle at position (276, 130).
; PLAN: r0=276(x), r1=130(y), r2=103(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 130
LDI r2, 103
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
