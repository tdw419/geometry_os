; DESCRIPTION: Places a white 30x113 rectangle at position (175, 14).
; PLAN: r0=175(x), r1=14(y), r2=30(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 14
LDI r2, 30
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
