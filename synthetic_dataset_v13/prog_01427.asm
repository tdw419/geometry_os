; DESCRIPTION: Places a white 20x113 rectangle at position (70, 107).
; PLAN: r0=70(x), r1=107(y), r2=20(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 107
LDI r2, 20
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
