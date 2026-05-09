; DESCRIPTION: Places a white 111x10 rectangle at position (351, 146).
; PLAN: r0=351(x), r1=146(y), r2=111(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 146
LDI r2, 111
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
