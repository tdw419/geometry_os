; DESCRIPTION: Places a green 55x60 rectangle at position (0, 111).
; PLAN: r0=0(x), r1=111(y), r2=55(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 111
LDI r2, 55
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
