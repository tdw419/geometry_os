; DESCRIPTION: Places a blue 75x46 rectangle at position (154, 111).
; PLAN: r0=154(x), r1=111(y), r2=75(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 111
LDI r2, 75
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
