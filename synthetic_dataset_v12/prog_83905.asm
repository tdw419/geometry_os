; DESCRIPTION: Places a white 12x72 rectangle at position (254, 111).
; PLAN: r0=254(x), r1=111(y), r2=12(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 111
LDI r2, 12
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
