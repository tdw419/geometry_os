; DESCRIPTION: Places a white 28x48 rectangle at position (310, 150).
; PLAN: r0=310(x), r1=150(y), r2=28(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 150
LDI r2, 28
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
