; DESCRIPTION: Places a magenta 43x21 rectangle at position (70, 111).
; PLAN: r0=70(x), r1=111(y), r2=43(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 111
LDI r2, 43
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
