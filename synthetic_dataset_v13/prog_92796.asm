; DESCRIPTION: Places a cyan 76x111 rectangle at position (241, 111).
; PLAN: r0=241(x), r1=111(y), r2=76(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 111
LDI r2, 76
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
