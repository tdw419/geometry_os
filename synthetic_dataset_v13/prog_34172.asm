; DESCRIPTION: Places a white 93x107 rectangle at position (163, 111).
; PLAN: r0=163(x), r1=111(y), r2=93(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 111
LDI r2, 93
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
