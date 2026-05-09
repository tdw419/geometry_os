; DESCRIPTION: Places a yellow 38x67 rectangle at position (432, 111).
; PLAN: r0=432(x), r1=111(y), r2=38(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 111
LDI r2, 38
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
