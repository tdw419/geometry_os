; DESCRIPTION: Places a yellow 75x19 rectangle at position (78, 111).
; PLAN: r0=78(x), r1=111(y), r2=75(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 111
LDI r2, 75
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
