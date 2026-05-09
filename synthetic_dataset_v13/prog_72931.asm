; DESCRIPTION: Places a green 85x57 rectangle at position (416, 111).
; PLAN: r0=416(x), r1=111(y), r2=85(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 111
LDI r2, 85
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
