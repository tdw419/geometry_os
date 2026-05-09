; DESCRIPTION: Places a white 22x100 rectangle at position (215, 5).
; PLAN: r0=215(x), r1=5(y), r2=22(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 5
LDI r2, 22
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
