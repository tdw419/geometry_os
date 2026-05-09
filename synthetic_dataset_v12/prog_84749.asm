; DESCRIPTION: Places a orange 37x115 rectangle at position (293, 111).
; PLAN: r0=293(x), r1=111(y), r2=37(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 111
LDI r2, 37
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
