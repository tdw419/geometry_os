; DESCRIPTION: Places a white 12x52 rectangle at position (98, 111).
; PLAN: r0=98(x), r1=111(y), r2=12(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 111
LDI r2, 12
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
