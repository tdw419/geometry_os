; DESCRIPTION: Places a white 63x37 rectangle at position (284, 16).
; PLAN: r0=284(x), r1=16(y), r2=63(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 16
LDI r2, 63
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
