; DESCRIPTION: Places a white 76x87 rectangle at position (305, 144).
; PLAN: r0=305(x), r1=144(y), r2=76(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 144
LDI r2, 76
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
