; DESCRIPTION: Places a white 111x65 rectangle at position (365, 94).
; PLAN: r0=365(x), r1=94(y), r2=111(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 94
LDI r2, 111
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
