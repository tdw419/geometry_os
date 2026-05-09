; DESCRIPTION: Places a yellow 75x99 rectangle at position (40, 111).
; PLAN: r0=40(x), r1=111(y), r2=75(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 111
LDI r2, 75
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
