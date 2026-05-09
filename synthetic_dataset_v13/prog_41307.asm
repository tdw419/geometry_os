; DESCRIPTION: Places a white 23x106 rectangle at position (444, 111).
; PLAN: r0=444(x), r1=111(y), r2=23(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 111
LDI r2, 23
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
