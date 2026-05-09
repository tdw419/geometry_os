; DESCRIPTION: Places a blue 111x12 rectangle at position (309, 82).
; PLAN: r0=309(x), r1=82(y), r2=111(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 82
LDI r2, 111
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
