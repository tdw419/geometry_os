; DESCRIPTION: Places a purple 92x77 rectangle at position (83, 111).
; PLAN: r0=83(x), r1=111(y), r2=92(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 111
LDI r2, 92
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
