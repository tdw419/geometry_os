; DESCRIPTION: Places a green 69x11 rectangle at position (91, 111).
; PLAN: r0=91(x), r1=111(y), r2=69(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 111
LDI r2, 69
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
