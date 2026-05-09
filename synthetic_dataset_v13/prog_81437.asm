; DESCRIPTION: Places a white 19x86 rectangle at position (371, 150).
; PLAN: r0=371(x), r1=150(y), r2=19(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 150
LDI r2, 19
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
