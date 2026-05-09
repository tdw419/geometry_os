; DESCRIPTION: Places a white 43x113 rectangle at position (220, 37).
; PLAN: r0=220(x), r1=37(y), r2=43(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 37
LDI r2, 43
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
