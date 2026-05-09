; DESCRIPTION: Places a yellow 65x40 rectangle at position (131, 111).
; PLAN: r0=131(x), r1=111(y), r2=65(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 111
LDI r2, 65
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
