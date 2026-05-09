; DESCRIPTION: Places a magenta 98x22 rectangle at position (164, 111).
; PLAN: r0=164(x), r1=111(y), r2=98(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 111
LDI r2, 98
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
