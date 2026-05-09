; DESCRIPTION: Places a yellow 99x102 rectangle at position (84, 111).
; PLAN: r0=84(x), r1=111(y), r2=99(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 111
LDI r2, 99
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
