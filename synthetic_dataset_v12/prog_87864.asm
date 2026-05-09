; DESCRIPTION: Places a white 42x23 rectangle at position (398, 88).
; PLAN: r0=398(x), r1=88(y), r2=42(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 88
LDI r2, 42
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
