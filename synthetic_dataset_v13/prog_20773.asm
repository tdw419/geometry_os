; DESCRIPTION: Places a cyan 39x63 rectangle at position (274, 55).
; PLAN: r0=274(x), r1=55(y), r2=39(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 55
LDI r2, 39
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
