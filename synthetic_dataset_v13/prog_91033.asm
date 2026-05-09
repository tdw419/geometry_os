; DESCRIPTION: Places a white 30x11 rectangle at position (394, 150).
; PLAN: r0=394(x), r1=150(y), r2=30(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 150
LDI r2, 30
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
