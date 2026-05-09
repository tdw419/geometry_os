; DESCRIPTION: Places a white 51x14 rectangle at position (229, 111).
; PLAN: r0=229(x), r1=111(y), r2=51(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 111
LDI r2, 51
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
