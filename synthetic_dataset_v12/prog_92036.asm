; DESCRIPTION: Places a white 60x20 rectangle at position (320, 1).
; PLAN: r0=320(x), r1=1(y), r2=60(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 1
LDI r2, 60
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
