; DESCRIPTION: Places a magenta 50x55 rectangle at position (340, 111).
; PLAN: r0=340(x), r1=111(y), r2=50(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 111
LDI r2, 50
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
