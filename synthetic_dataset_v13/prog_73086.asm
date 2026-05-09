; DESCRIPTION: Places a white 16x77 rectangle at position (224, 83).
; PLAN: r0=224(x), r1=83(y), r2=16(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 83
LDI r2, 16
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
