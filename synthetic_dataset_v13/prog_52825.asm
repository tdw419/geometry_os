; DESCRIPTION: Places a yellow 95x63 rectangle at position (321, 111).
; PLAN: r0=321(x), r1=111(y), r2=95(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 111
LDI r2, 95
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
