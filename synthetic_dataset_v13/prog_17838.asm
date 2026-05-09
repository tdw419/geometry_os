; DESCRIPTION: Places a white 64x27 rectangle at position (222, 111).
; PLAN: r0=222(x), r1=111(y), r2=64(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 111
LDI r2, 64
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
