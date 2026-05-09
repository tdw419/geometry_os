; DESCRIPTION: Places a orange 98x111 rectangle at position (195, 55).
; PLAN: r0=195(x), r1=55(y), r2=98(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 55
LDI r2, 98
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
