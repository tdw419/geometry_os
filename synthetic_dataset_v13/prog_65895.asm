; DESCRIPTION: Places a white 33x85 rectangle at position (36, 111).
; PLAN: r0=36(x), r1=111(y), r2=33(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 111
LDI r2, 33
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
